Return-Path: <linux-renesas-soc+bounces-13567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7694DA41E8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84B091893A45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 12:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7581248882;
	Mon, 24 Feb 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Crgs2+3e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897A24886D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740398782; cv=none; b=PySoUaOOxRFlx0HEEt0hVMh9A3q+Rx/QjQ23jUmsTw7bJEEnx2Ixsji51CcG85dck8Y/QPSW+M637pqh0Zu4hmTW5fpvB8i7uZpcYFSgXxxhmajFq4ezGDye5H9HxIcnAIGtmJIuUW5pdecKkoVD1q+G79kbOVbh2z/kSY0oCG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740398782; c=relaxed/simple;
	bh=URMg2LDs6fo+NEkASxaRt+0YbEVl/TZQfNLU8BSd+FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXObFtdJDeByRHzGYb4RLRi8f6E42LXVxPOu9DIh4bDSli8Lhi3MitqCi1VOMi6fX3scj6pgXvsvpE3UisFcbLqqch/PgFdVJ0KxGyELjs7OxU133LZSLYnEfKfV3U4Q+dN76eVXFUlIkiiJHK63ZOXtLnU+XFyqx5tCFXTf0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Crgs2+3e; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaec111762bso54536166b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 04:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740398779; x=1741003579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crkHZb+VMWxE+9KvxQ4OcC5nXG+5ovO5aPbgk0e5AiI=;
        b=Crgs2+3e8Hh2o34DK4ZxGobFDGnqH+Sj7tnNMVhd+Lsa/qkD4RmvNhUhk/48SyXmn5
         Fzh+dhN255ctX5IH+udlokeywhfb1144hFlI1ad61EeKdCHyV2H6JZiEyuwzmv8PpR95
         hakjKNWr0a5aYKGGjUH/VctMU6We3KZnuLXLxxc4vyEdQcNkE7q8n92pSip7oIZyR6do
         sIlAcb6gyb14wOViAO5Cd48AUQ/0UgAEjlT/Mi41Z3uRiF1PEI1l9kjALAEaceS10Qz6
         rwF3V8H1gBicopFGlXKSbMIhdcJEs6cCVp0hkhI+pOYXyTV1d1hCnrD5hc3cIQKlvyf0
         yIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740398779; x=1741003579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crkHZb+VMWxE+9KvxQ4OcC5nXG+5ovO5aPbgk0e5AiI=;
        b=E5dqnwI31RGL3jyymB6U2yRhuuphbJgtwhrTLekky0q4ijpcHI9EbSPK4NensyKq6g
         oaKWwHBdkiUcF+7KK7xE7NikR8aeZy0/L8iXZp6zch0bNmYXKVrxdq1QsfOxvVnpAwE2
         ZzxHpjL+aUaGeW5Vd6vsgr5BNhMk/kOjKHqtZyYnZTpGf1q4+dxcvWmmZxfc6FoLfjA1
         17NYzQOi4wa9u+nhRFJ2I/kqQ27rlGEJNlbuzAQSg2Avn8GYBeI5TFaqAroBjLb3mkGW
         jWOLS26oW6OMzz9DnJoCEO8xev1SjZ0RovnzEa3LaOFg91Je1coO58/XrVrkqH+jricl
         xkjA==
X-Forwarded-Encrypted: i=1; AJvYcCUMrsGLbCcwRqjKOLEKfcvQcTsC0wdqmultUfEXf5Eiw7p94JsoCBPfqAzLQRtnG31KMfdcDYJxMomvTbaw+MSPWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH69PrUtIWYVcJh2Dh0PhdarSXrAS7LtcYvraa0tIMy+xGI0CE
	072bdJX0B5gxaIAqVwn/I4XDW0t6fO+9iDNI3Aix5xSF4Mrpl+4kP7KKaKsw5ek=
X-Gm-Gg: ASbGncvr00d/8h50808JBrOB1nhanhv6d1lnSUtVRCKuBcbXsg7zfgLvlOE27LI4pZM
	8WsqklL7j8dQ/j58ffJHLIxGoJgEs94nu2WXjf4dBRryg3FfIcpcgzzOh5WVsOjgZaZsrTALfgp
	vQJ5jPRQS3XxD/pl6nEEMlb6YOIni929jHWyZSFI/vfUft9hNj9GGCT9I9eZZ12g1jvYRADg7q/
	KUSqbCQy5Dnkbmfl12mqWM+UokbZr94lDVg2MxTiUWw+dJpY/b/5KF3sdWsP2tarvODAlw6TH00
	LJ77ncI6asMDyWmShwc95p7+JL1YU0PBa8blQ2G6Kc1uA7vRhlUMxMw=
X-Google-Smtp-Source: AGHT+IEqNkgqZI4tao7V/PlNrHFkxf3OGZTtMDEK4fVis6RnPkXJUXKKWXIof0yAAG3QH6I5E2M+WA==
X-Received: by 2002:a17:907:c920:b0:abc:c40:b385 with SMTP id a640c23a62f3a-abc0c40bb25mr983495766b.37.1740398778748;
        Mon, 24 Feb 2025 04:06:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb978e2c9dsm1598901966b.65.2025.02.24.04.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 04:06:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/2] iio: adc: rzg2l_adc: Open a devres group
Date: Mon, 24 Feb 2025 14:06:06 +0200
Message-ID: <20250224120608.1769039-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224120608.1769039-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250224120608.1769039-1-claudiu.beznea.uj@bp.renesas.com>
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

Open a devres group in the driver probe and release it in the driver
remove. This ensures the runtime PM is disabled (though the devres group)
after the rzg2l_adc_remove() finishes its execution avoiding the described
scenario.

Fixes: 89ee8174e8c8 ("iio: adc: rzg2l_adc: Simplify the runtime PM code")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- open a devres group in probe and release it in remove; the failure
  path of probe() was also updated to close the devres group
- dropped Ulf's Rb tag as the patch is different now
- updated the patch description to match the new approach

Note: a generic approach was proposed in [1] to have this in the platform
bus itself but wasn't seen acceptable.

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/

Changes in v2:
- collected Ulf's tag
- add a comment above pm_runtime_enable() explaining the reason
  it shouldn't be converted to devres
- drop devres calls that request IRQ and register IIO device
  as proposed in the review process: Ulf, I still kept you Rb
  tag; please let me know otherwise

 drivers/iio/adc/rzg2l_adc.c | 88 ++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 883c167c0670..7db04416e1cf 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -85,6 +85,7 @@ struct rzg2l_adc {
 	struct reset_control *adrstn;
 	const struct rzg2l_adc_data *data;
 	const struct rzg2l_adc_hw_params *hw_params;
+	void *devres_group_id;
 	struct completion completion;
 	struct mutex lock;
 	u16 last_val[RZG2L_ADC_MAX_CHANNELS];
@@ -429,60 +430,88 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct iio_dev *indio_dev;
 	struct rzg2l_adc *adc;
+	void *devres_group_id;
 	int ret;
 	int irq;
 
-	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
-	if (!indio_dev)
+	/*
+	 * Open a devres group to allow using devm_pm_runtime_enable()
+	 * w/o interfeering with dev_pm_genpd_detach() in the platform bus
+	 * remove. Otherwise, durring repeated unbind/bind operations,
+	 * the ADC may be runtime resumed when it is not part of its power
+	 * domain, leading to accessing ADC registers without its clocks
+	 * being enabled and its PM domain being turned on.
+	 */
+	devres_group_id = devres_open_group(dev, NULL, GFP_KERNEL);
+	if (!devres_group_id)
 		return -ENOMEM;
 
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!indio_dev) {
+		ret = -ENOMEM;
+		goto release_group;
+	}
+
 	adc = iio_priv(indio_dev);
 
+	adc->devres_group_id = devres_group_id;
 	adc->hw_params = device_get_match_data(dev);
-	if (!adc->hw_params || adc->hw_params->num_channels > RZG2L_ADC_MAX_CHANNELS)
-		return -EINVAL;
+	if (!adc->hw_params || adc->hw_params->num_channels > RZG2L_ADC_MAX_CHANNELS) {
+		ret = -EINVAL;
+		goto release_group;
+	}
 
 	ret = rzg2l_adc_parse_properties(pdev, adc);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	mutex_init(&adc->lock);
 
 	adc->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(adc->base))
-		return PTR_ERR(adc->base);
+	if (IS_ERR(adc->base)) {
+		ret = PTR_ERR(adc->base);
+		goto release_group;
+	}
 
 	adc->adrstn = devm_reset_control_get_exclusive_deasserted(dev, "adrst-n");
-	if (IS_ERR(adc->adrstn))
-		return dev_err_probe(dev, PTR_ERR(adc->adrstn),
-				     "failed to get/deassert adrst-n\n");
+	if (IS_ERR(adc->adrstn)) {
+		ret = dev_err_probe(dev, PTR_ERR(adc->adrstn),
+				    "failed to get/deassert adrst-n\n");
+		goto release_group;
+	}
 
 	adc->presetn = devm_reset_control_get_exclusive_deasserted(dev, "presetn");
-	if (IS_ERR(adc->presetn))
-		return dev_err_probe(dev, PTR_ERR(adc->presetn),
-				     "failed to get/deassert presetn\n");
+	if (IS_ERR(adc->presetn)) {
+		ret = dev_err_probe(dev, PTR_ERR(adc->presetn),
+				    "failed to get/deassert presetn\n");
+		goto release_group;
+	}
 
 	pm_runtime_set_autosuspend_delay(dev, 300);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	platform_set_drvdata(pdev, indio_dev);
 
 	ret = rzg2l_adc_hw_init(dev, adc);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to initialize ADC HW\n");
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret,
+				    "failed to initialize ADC HW\n");
+		goto release_group;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto release_group;
+	}
 
 	ret = devm_request_irq(dev, irq, rzg2l_adc_isr,
 			       0, dev_name(dev), adc);
 	if (ret < 0)
-		return ret;
+		goto release_group;
 
 	init_completion(&adc->completion);
 
@@ -492,7 +521,23 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 	indio_dev->channels = adc->data->channels;
 	indio_dev->num_channels = adc->data->num_channels;
 
-	return devm_iio_device_register(dev, indio_dev);
+	ret = devm_iio_device_register(dev, indio_dev);
+	if (ret)
+		goto release_group;
+
+	return 0;
+
+release_group:
+	devres_release_group(dev, devres_group_id);
+	return ret;
+}
+
+static void rzg2l_adc_remove(struct platform_device *pdev)
+{
+	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+	struct rzg2l_adc *adc = iio_priv(indio_dev);
+
+	devres_release_group(&pdev->dev, adc->devres_group_id);
 }
 
 static const struct rzg2l_adc_hw_params rzg2l_hw_params = {
@@ -614,6 +659,7 @@ static const struct dev_pm_ops rzg2l_adc_pm_ops = {
 
 static struct platform_driver rzg2l_adc_driver = {
 	.probe		= rzg2l_adc_probe,
+	.remove		= rzg2l_adc_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
 		.of_match_table = rzg2l_adc_match,
-- 
2.43.0


