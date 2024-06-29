import * as Yup from 'yup';
import PropTypes from 'prop-types';
import { useState } from 'react';
import { useFormik, Form, FormikProvider } from 'formik';
import { v4 as uuidv4 } from 'uuid';
// material
import { TextField, Button } from '@material-ui/core';
import { Stack } from '@mui/material';
import AdapterDateFns from '@mui/lab/AdapterDateFns';
import LocalizationProvider from '@mui/lab/LocalizationProvider';
import MobileDatePicker from '@mui/lab/MobileDatePicker';
// ----------------------------------------------------------------------

function TestForm({ handleBack, handleNext, setDetails, code, setTestId }) {
  const testId = uuidv4();
  const [dueDate, setDueDate] = useState(new Date());
  const RegisterSchema = Yup.object().shape({
    name: Yup.string()
      .min(2, 'Too Short!')
      .max(50, 'Too Long!')
      .required('Test Name is required !'),
    marks: Yup.number().required('Marks is required !'),
    durationHrs: Yup.number().required('Duration is required !'),
    durationMin: Yup.number().required('Durat ion is required !')
  });

  const formik = useFormik({
    initialValues: {
      name: '',
      marks: '',
      durationHrs: '',
      durationMin: ''
    },
    validationSchema: RegisterSchema,
    onSubmit: (values) => {
      console.log({ ...values, dueDate });
      setDetails({ ...values, dueDate, code, testId });
      setTestId(testId);
      handleNext();
    }
  });

  const { errors, touched, handleSubmit, getFieldProps } = formik;

  return (
    <FormikProvider value={formik}>
      <Form autoComplete="off" noValidate onSubmit={handleSubmit}>
        <Stack spacing={3}>
          <Stack direction={{ xs: 'column', sm: 'row' }} spacing={2}>
            <TextField
              fullWidth
              label="Name"
              {...getFieldProps('name')}
              error={Boolean(touched.name && errors.name)}
              helperText={touched.name && errors.name}
            />

            <TextField
              fullWidth
              label="Marks"
              {...getFieldProps('marks')}
              error={Boolean(touched.marks && errors.marks)}
              helperText={touched.marks && errors.marks}
            />
          </Stack>
          <Stack direction={{ xs: 'column', sm: 'row' }} spacing={2}>
            <TextField
              fullWidth
              label="Duration Hours "
              {...getFieldProps('durationHrs')}
              error={Boolean(touched.durationHrs && errors.durationHrs)}
              helperText={touched.durationHrs && errors.durationHrs}
            />

            <TextField
              fullWidth
              label="Duration Mins"
              {...getFieldProps('durationMin')}
              error={Boolean(touched.durationMin && errors.durationMin)}
              helperText={touched.durationMin && errors.durationMin}
            />
          </Stack>

          <LocalizationProvider dateAdapter={AdapterDateFns}>
            <MobileDatePicker
              label="Due Date"
              inputFormat="dd/MM/yyyy"
              value={dueDate}
              onChange={(newValue) => {
                setDueDate(newValue);
              }}
              error={Boolean(touched.dueDate && errors.dueDate)}
              helperText={touched.dueDate && errors.dueDate}
              renderInput={(params) => <TextField {...params} />}
            />
          </LocalizationProvider>
          <div style={{ position: 'relative' }}>
            <div style={{ position: 'absolute', right: 0 }}>
              <Button variant="contained" disabled style={{ margin: 5 }} onClick={handleBack}>
                Back
              </Button>
              <Button
                disableElevation
                style={{ margin: 10 }}
                variant="contained"
                color="primary"
                type="submit"
              >
                Next
              </Button>
            </div>
          </div>
        </Stack>
      </Form>
    </FormikProvider>
  );
}

TestForm.propTypes = {
  handleBack: PropTypes.func.isRequired,
  handleNext: PropTypes.func.isRequired,
  setDetails: PropTypes.func.isRequired,
  code: PropTypes.string.isRequired,
  setTestId: PropTypes.func.isRequired
};

export default TestForm;
