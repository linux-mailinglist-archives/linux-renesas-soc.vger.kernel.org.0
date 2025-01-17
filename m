Return-Path: <linux-renesas-soc+bounces-12216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D056A14EA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 12:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B483E188A33D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 11:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042601FE45D;
	Fri, 17 Jan 2025 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HoUGYT5C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD91FC7F7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2025 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737114355; cv=none; b=IFt0oP/idmpAMcjkHEvzmCY9IWXlTNX7Y+h5JY3WotZngMGbHlcHP5s+z2zr7xjCCskPFvCI7rvtiMc78Lqab3jCTx1iRabnezGUQsxcOeRAQ0syF9fHVKuP0uLNPkxRbH5rQgJrMhlDHlDkvARgbR2VqcyHxSxm8horDKVF4JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737114355; c=relaxed/simple;
	bh=53V4mDk+itym6kMFP2LAtwCEDK2W9XMEniFbze8Xb58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuRVcvvYp5eyluJVk3TdOjjdZyEOXIHbbaMMPmowEsBz8iNqWX/paNhVmPu3GaeyO/7j1Bcdah+DhHMlXocC0Al4SxFB9z9oWL/tnkDLQHurOXh7eU5njaWU3XIyYJ5E0wXBEhsK8u67xXJpOaG/dxUIuZMpU4kwb0/4FTUlFdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HoUGYT5C; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e27c75f4so1581197f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jan 2025 03:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737114352; x=1737719152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDWSQkaFP0eTmUAVm7GcOJC09zF+62CBev8hupRleKw=;
        b=HoUGYT5CHIO/otbFKeiooWH5qLEBqWjJlLyj8COpml+jfWDm7fj3goU6LRlukzH9Ok
         0+ePTzhWSfPXva3qhyB6XQfvbW3nTlDXstsmLhS5iFmeWRmOjD3/k2QMZVurtyyXR35Q
         unK7iXDVXF7QxDR2lyS2gdqRidxsmB9WJGFBGK9nPtKFoT8UBXwLNozV52hYV5OoeKkB
         bwgxnX7xTk8pAMl+/dfqbH23v0EWWhWLpEslZE+eYYKYoRB+b8dNn8MOI13+Qc2QRPlk
         HwfKGIkC3k2scQyJ+hZ7Rc/dRjdI+X4KazdFCh0s89d0xeQxeYyllPhEH7zFgE3QMJna
         p2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737114352; x=1737719152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDWSQkaFP0eTmUAVm7GcOJC09zF+62CBev8hupRleKw=;
        b=YQKWHvnMa32j0cxU6GV0vScyRDkZoixR62CwPwba8dA68g5QbKeW6ihptjII2K9WPh
         NnhyVsg2wDzDUD9TR7Y1zfBEqdDkiHrfKNLIMJeB/q35ymqPQfYbIV8zGNhSyixE8Idd
         3PH4x+XEuTLm+kGWa1TRXKarC4s9TAnuJpaSYA+bLdlfpeRQCrSvkNz05qbh0bqZ5SNq
         irtMleq2kez6xP1W6OGErXksxfQG8KjgN+/CKIPe0cieAWHtoT1SmRDGg2mAnpl7cAWF
         Jbt/M4nix+HZg9hF0SjUzwAqYASyoHKjBIC3q22zYe89aCn0hhffYLYob8zzX+ricWQL
         hULg==
X-Forwarded-Encrypted: i=1; AJvYcCV/++yQIwRsIra3Mg9sjpUMlhicTqh9B69SpKmS97qJzvxLnTRKvNn5dK1qKfuM4etMJo1Yf0aSPEHfHPw8kiayzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRNg6vkPVPxBWuodoTyp30tflXogPuybS0ZCsYelfXSnxRdhmp
	jlbiYU+Toluictq5UXbv+5xx4EOQo4/R/uoWuoIl19MuXy9UiZgMU+AYaE+68x0=
X-Gm-Gg: ASbGncvDyR9eca40VAGXFe90eAIb37uVCNEF1+sxcpgzJIdukVjszr8UODNyK0cAPFd
	YJuwDR7EtY92v7pyN71rQp8mC9Kpv45KDaGgT5b/MRlhLIYR/XtTQj7anpIiG0bNamz5WmlHy6H
	68Rtm/T2xUSjet97DQAeP+jqvqwrBnEmmve3I3cqbPPnwi6gZ8HZA7k0QQowHiiVWs4ucJW3M3O
	ad1jSNFRm8Gv6iUX9b7jgTvwcGrp3nGXLbiPXCYto47fImaEwGDP8WtVSeaOIdbZEuRFYia8VRA
	fnJwc206HZk=
X-Google-Smtp-Source: AGHT+IGU/eWQr6GxoGkP+hRgnfbSFQIEduWrJJ3ySOP/gb2XWklvdeAu5zzmhcBMS+53D7WILmKsYw==
X-Received: by 2002:a5d:588b:0:b0:385:f1d9:4b90 with SMTP id ffacd0b85a97d-38bf577f826mr1988861f8f.13.1737114352231;
        Fri, 17 Jan 2025 03:45:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aab8sm2348496f8f.57.2025.01.17.03.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 03:45:51 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/2] iio: adc: rzg2l_adc: Drop devm_pm_runtime_enable()
Date: Fri, 17 Jan 2025 13:45:39 +0200
Message-ID: <20250117114540.289248-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250117114540.289248-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250117114540.289248-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On all systems where the rzg2l_adc driver is used, the ADC clocks are part
of a PM domain. The code that implements the PM domains support is in
drivers/clk/renesas/rzg2l-cpg.c, the functions of interest for this commit
being rzg2l_cpg_attach_dev() and rzg2l_cpg_deattach_dev(). The PM
domains support is registered with GENPD_FLAG_PM_CLK which, according to
the documentation, instructs genpd to use the PM clk framework while
powering on/off attached devices.

During probe, the ADC device is attached to the PM domain
controlling the ADC clocks. Similarly, during removal, the ADC device is
detached from the PM domain.

The detachment call stack is as follows:

device_driver_detach() ->
  device_release_driver_internal() ->
    __device_release_driver() ->
      device_remove() ->
        platform_remove() ->
          dev_pm_domain_detach()

During driver unbind, after the ADC device is detached from its PM domain,
the device_unbind_cleanup() function is called, which subsequently invokes
devres_release_all(). This function handles devres resource cleanup.

If runtime PM is enabled via devm_pm_runtime_enable(), the cleanup process
triggers the action or reset function for disabling runtime PM. This
function is pm_runtime_disable_action(), which leads to the following call
stack of interest when called:

pm_runtime_disable_action() ->
  pm_runtime_dont_use_autosuspend() ->
    __pm_runtime_use_autosuspend() ->
      update_autosuspend() ->
        rpm_idle()

The rpm_idle() function attempts to runtime resume the ADC device. However,
at the point it is called, the ADC device is no longer part of the PM
domain (which manages the ADC clocks). Since the rzg2l_adc runtime PM
APIs directly modifies hardware registers, the
rzg2l_adc_pm_runtime_resume() function is invoked without the ADC clocks
being enabled. This is because the PM domain no longer resumes along with
the ADC device. As a result, this leads to system aborts.

Drop the devres API for runtime PM enable along with the other devres APIs
after it (devm_request_irq(), devm_register_iio_device()).

Fixes: 89ee8174e8c8 ("iio: adc: rzg2l_adc: Simplify the runtime PM code")
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected Ulf's tag
- add a comment above pm_runtime_enable() explaining the reason
  it shouldn't be converted to devres
- drop devres calls that request IRQ and register IIO device
  as proposed in the review process: Ulf, I still kept you Rb
  tag; please let me know otherwise

 drivers/iio/adc/rzg2l_adc.c | 60 ++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 883c167c0670..4742a727a80c 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -87,6 +87,7 @@ struct rzg2l_adc {
 	const struct rzg2l_adc_hw_params *hw_params;
 	struct completion completion;
 	struct mutex lock;
+	int irq;
 	u16 last_val[RZG2L_ADC_MAX_CHANNELS];
 	bool was_rpm_active;
 };
@@ -430,7 +431,6 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 	struct iio_dev *indio_dev;
 	struct rzg2l_adc *adc;
 	int ret;
-	int irq;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
 	if (!indio_dev)
@@ -464,25 +464,33 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(dev, 300);
 	pm_runtime_use_autosuspend(dev);
-	ret = devm_pm_runtime_enable(dev);
-	if (ret)
-		return ret;
+	/*
+	 * Use non-devres APIs from this point onward, as the ADC clocks are
+	 * managed through its power domain. Otherwise, durring repeated
+	 * unbind/bind operations, the ADC may be runtime resumed when it
+	 * is not part of its power domain, leading to accessing ADC
+	 * registers without its clocks being enabled and its PM domain
+	 * being turned on.
+	 */
+	pm_runtime_enable(dev);
 
 	platform_set_drvdata(pdev, indio_dev);
 
 	ret = rzg2l_adc_hw_init(dev, adc);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to initialize ADC HW\n");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "failed to initialize ADC HW\n");
+		goto rpm_disable;
+	}
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		goto rpm_disable;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	adc->irq = ret;
 
-	ret = devm_request_irq(dev, irq, rzg2l_adc_isr,
-			       0, dev_name(dev), adc);
+	ret = request_irq(adc->irq, rzg2l_adc_isr, 0, dev_name(dev), adc);
 	if (ret < 0)
-		return ret;
+		goto rpm_disable;
 
 	init_completion(&adc->completion);
 
@@ -492,7 +500,30 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = adc->data->channels;
 	indio_dev->num_channels = adc->data->num_channels;
 
-	return devm_iio_device_register(dev, indio_dev);
+	ret = iio_device_register(indio_dev);
+	if (ret)
+		goto free_irq;
+
+	return 0;
+
+free_irq:
+	free_irq(adc->irq, adc);
+rpm_disable:
+	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+	return ret;
+}
+
+static void rzg2l_adc_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct rzg2l_adc *adc = iio_priv(indio_dev);
+
+	iio_device_unregister(indio_dev);
+	free_irq(adc->irq, adc);
+	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const struct rzg2l_adc_hw_params rzg2l_hw_params = {
@@ -614,6 +645,7 @@ static const struct dev_pm_ops rzg2l_adc_pm_ops = {
 
 static struct platform_driver rzg2l_adc_driver = {
 	.probe		= rzg2l_adc_probe,
+	.remove		= rzg2l_adc_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
 		.of_match_table = rzg2l_adc_match,
-- 
2.43.0


