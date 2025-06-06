Return-Path: <linux-renesas-soc+bounces-17888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7BAD011D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 13:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B4D516BFCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Jun 2025 11:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36382882BC;
	Fri,  6 Jun 2025 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DBKCcI3b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6F02874FA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Jun 2025 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208682; cv=none; b=jsdav3LYX6bNrZ+JZ8//4Kom8AwVrTelZdcMebKZBYuU37Yk3thu3r70+mWr33kBk+KUJfERSsDboANhGFSAWtYcIZLn3kQA3G97B0KvjniGADUERDRK9PiZGIOYWVmKMIrKTbv3TLSlZnIv7XQGqBviayVx5Nlarg1m6P056Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208682; c=relaxed/simple;
	bh=2Zf9PqQ/xdsUa49ohUw4b0FzbCTktzpyC6txhBl+f2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srdFrH8Ly7svB6xRtuaEzbVdgziqoyPhAbZK1G6Kx5zKCL6Z419dB2Xdwpv6BBYg3fezfN5LKsl+oy58M7cHzRcWVmpictYi3aC5hludMuXgxbjTTrG814S0I0BVI75gB4r4NOxViWzUZ3gIPzfTVOjZ5FjWFOBmnvRdCgnQkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DBKCcI3b; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6077e0f2697so942092a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jun 2025 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749208679; x=1749813479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9UeLBEeNgVFZxNvwdqTWlF8knLYtgrdcWBf2xtn+Ko=;
        b=DBKCcI3bfOOqblSO59w3vot2T5GnEqknF0Su7dLvhZMIBNr8p9BZ95rbGQbs3j4WpD
         qbCqEYY4hLdbAhb3jWAM/2NyRD+25CDi5k5tBlusNs7gxbHSWTpwAc18MRXAolRyD/x9
         KHxaM76gTLUXbwsQtU4VVHC9Bbe1B05dEhSP0wcTErxGdzmOdauyErGGZNi/yIENpjcr
         GS5mcAYz5FliR/9cUX2FdYs6igndNfZ2S4ql5b9CBk2K4gfygovFfhGcqB8fFbjJwjBu
         FKDBTtlIxndAzYjsRtVlNuF7Sit+Yo82+6a4us7WK2tZKW+ZsAnHZwe0U5HmIM7NYLlN
         dvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749208679; x=1749813479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9UeLBEeNgVFZxNvwdqTWlF8knLYtgrdcWBf2xtn+Ko=;
        b=jV1S/yWvcYbotE4U5anqs9+4FWb6XjBVCWSHzGtUn+0R0JMqkTNbD2gTSS579iBT9o
         SssPddrIqcrwJpa/dki9QBdSx27H5Cl2C8E0tYlxbhOIueflvWDGkR01yiO7DxqQ1yYB
         NMKcKWrl97A4GhKAyEE2ls/FsknDrSrQz9vVEFBRLatjiiOeWhNGZAHYCyfKe+lxolRU
         tr92BuWWLSy2fsWR8g4Cnflx6Eikk44CTB9hQ0x8GKHZN1OQgckzlp1T0BrfE96G2imH
         7ayk0Hfc0cvs0rAOBA7MYJ89b2yQUuE8lAczNrTllJ6vbd9V/jTu++iPi/VdIkJKjx/4
         QO/g==
X-Forwarded-Encrypted: i=1; AJvYcCX2pjfjTPTNUFzgF21KUQwQ/2c53/3PSj8Sw5oVwrveHXWOVrCAxDUtVVx5z6WsS9bj9xxXHme029+rofFMJA+MqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6qzL6InybsFwyqS9iMOyVHZF77CVVVvZdYHaeYpcfVm3BNkgf
	8RwVlCZrwMd0iyuNDs+ePtkju5RUuFblbIgaspWoCet8N8HbTyi7tvLcZTXMcBltLFs=
X-Gm-Gg: ASbGnctrbccmSRHN+QK48zfBbOWSVQ3i35MU0R+CzFBfn7slOAsT1Lv5HOqRycPzeKT
	KfONpFCnTCLnlbJjNbo2NRX/XV2WBftGbCpv8BxPPrpEuGEe1OC//sYeNHyIdd1sXF0I4JhuauQ
	MNYjYEnWRnFfRMdd12tTHzoKRrMw7lKSrIH/IA95QBLdtrkV5OO/dZdsnz1HLEJwctBOgSce8vy
	r6LpZPcqKSNQpGSBIXyRUpYTNjaM2Ztyt+ldMID8mLtVFjIUAdQ0NZf74BuAIiAGWzYeTITyC4c
	povwjtpT9iZiCWtinVwR4CL78Slj66043Aagmp7C3rP0nKf7I181TqB/hx+C8GjGuMSYRb5/EF7
	C9KLmgQ==
X-Google-Smtp-Source: AGHT+IG4VTq1mx5DeffErAs95tbKPfwNXjlN3PvJEQqp28QpBbWUEU9bT6nIWpBgMvdagmloO4L2qg==
X-Received: by 2002:a17:907:d24:b0:adb:41b1:feca with SMTP id a640c23a62f3a-ade1ab99b91mr213537666b.61.1749208678682;
        Fri, 06 Jun 2025 04:17:58 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7b566sm98704566b.164.2025.06.06.04.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:17:58 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	ulf.hansson@linaro.org,
	jic23@kernel.org,
	daniel.lezcano@linaro.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/2] PM: domains: Add devres variant for dev_pm_domain_attach()
Date: Fri,  6 Jun 2025 14:17:48 +0300
Message-ID: <20250606111749.3142348-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606111749.3142348-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250606111749.3142348-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The dev_pm_domain_attach() function is typically used in bus code alongside
dev_pm_domain_detach(), often following patterns like:

static int bus_probe(struct device *_dev)
{
    struct bus_driver *drv = to_bus_driver(dev->driver);
    struct bus_device *dev = to_bus_device(_dev);
    int ret;

    // ...

    ret = dev_pm_domain_attach(_dev, true);
    if (ret)
        return ret;

    if (drv->probe)
        ret = drv->probe(dev);

    // ...
}

static void bus_remove(struct device *_dev)
{
    struct bus_driver *drv = to_bus_driver(dev->driver);
    struct bus_device *dev = to_bus_device(_dev);

    if (drv->remove)
        drv->remove(dev);
    dev_pm_domain_detach(_dev);
}

When the driver's probe function uses devres-managed resources that depend
on the power domain state, those resources are released later during
device_unbind_cleanup().

Releasing devres-managed resources that depend on the power domain state
after detaching the device from its PM domain can cause failures.

For example, if the driver uses devm_pm_runtime_enable() in its probe
function, and the device's clocks are managed by the PM domain, then
during removal the runtime PM is disabled in device_unbind_cleanup() after
the clocks have been removed from the PM domain. It may happen that the
devm_pm_runtime_enable() action causes the device to be runtime-resumed.
If the driver specific runtime PM APIs access registers directly, this
will lead to accessing device registers without clocks being enabled.
Similar issues may occur with other devres actions that access device
registers.

Add devm_pm_domain_attach(). When replacing the dev_pm_domain_attach() and
dev_pm_domain_detach() in bus probe and bus remove, it ensures that the
device is detached from its PM domain in device_unbind_cleanup(), only
after all driver's devres-managed resources have been release.

For flexibility, the implemented devm_pm_domain_attach() has 2 state
arguments, one for the domain state on attach, one for the domain state on
detach.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- dropped devm_pm_domain_detach_off(), devm_pm_domain_detach_on()
  and use a single function devm_pm_domain_detach()

Changes in v2:
- none; this patch is new

 drivers/base/power/common.c | 50 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  6 +++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
index 781968a128ff..82ea20b343f5 100644
--- a/drivers/base/power/common.c
+++ b/drivers/base/power/common.c
@@ -115,6 +115,56 @@ int dev_pm_domain_attach(struct device *dev, bool power_on)
 }
 EXPORT_SYMBOL_GPL(dev_pm_domain_attach);
 
+/**
+ * devm_pm_domain_detach - devres action for devm_pm_domain_attach() to
+ * detach a device from its domain.
+ * @dev: device to detach.
+ * @res: indicate if the device should be powered off
+ *
+ * This function reverse the actions from devm_pm_domain_attach().
+ * It will be invoked during the remove phase from drivers implicitly.
+ */
+static void devm_pm_domain_detach(struct device *dev, void *res)
+{
+	bool *power_off = res;
+
+	dev_pm_domain_detach(dev, *power_off);
+}
+
+/**
+ * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
+ * @dev: Device to attach.
+ * @power_on: Use to indicate whether we should power on the device
+ *            when attaching.
+ *
+ * NOTE: this will also handle calling dev_pm_domain_detach() for
+ * you during remove phase.
+ *
+ * Returns 0 on successfully attached PM domain, or a negative error code in
+ * case of a failure.
+ */
+int devm_pm_domain_attach(struct device *dev, bool power_on)
+{
+	bool *power_off;
+	int ret;
+
+	power_off = devres_alloc(devm_pm_domain_detach, sizeof(*power_off), GFP_KERNEL);
+	if (!power_off)
+		return -ENOMEM;
+
+	ret = dev_pm_domain_attach(dev, power_on);
+	if (ret) {
+		devres_free(power_off);
+		return ret;
+	}
+
+	*power_off = power_on;
+	devres_add(dev, power_off);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_pm_domain_attach);
+
 /**
  * dev_pm_domain_attach_by_id - Associate a device with one of its PM domains.
  * @dev: The device used to lookup the PM domain.
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..f78b6b4dd734 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -509,6 +509,7 @@ struct device *dev_pm_domain_attach_by_name(struct device *dev,
 int dev_pm_domain_attach_list(struct device *dev,
 			      const struct dev_pm_domain_attach_data *data,
 			      struct dev_pm_domain_list **list);
+int devm_pm_domain_attach(struct device *dev, bool power_on);
 int devm_pm_domain_attach_list(struct device *dev,
 			       const struct dev_pm_domain_attach_data *data,
 			       struct dev_pm_domain_list **list);
@@ -539,6 +540,11 @@ static inline int dev_pm_domain_attach_list(struct device *dev,
 	return 0;
 }
 
+static inline int devm_pm_domain_attach(struct device *dev, bool power_on)
+{
+	return 0;
+}
+
 static inline int devm_pm_domain_attach_list(struct device *dev,
 					     const struct dev_pm_domain_attach_data *data,
 					     struct dev_pm_domain_list **list)
-- 
2.43.0


