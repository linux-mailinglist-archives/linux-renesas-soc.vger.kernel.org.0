Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74783ACA84
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 14:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbhFRMDd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 08:03:33 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:28170 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhFRMDb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 08:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624017668;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=yet5kwxmgYFceNOolXGmSWm7+n7MYrwnBCOg1RxJVKU=;
    b=EJJXk8l9vOnnK7NcAWmsK7gJYNfDFg5ltIMY3MMlVzcVx4y+cFhA7VH01CfsiJrlaT
    AXqh2WvVsycMX4ho2j/sEEH7A9XSOme3Xrhlv4vY9Yn6zMUMP8Ew7T9Aco3P4GDShLM1
    GMFjGZqet3YMqVXijcks68mRCpjcpm6oA1Tpr0BQcMuv0pbfchsFeouiYIfJaLCnkCUI
    DlLdwpXQ1SA7FwQx6KtVWmkDoKI+IFVc/eggEDIB6khj+MNGrQMGLBakKdZSLibMgwYi
    GnMTXz/l/AT93dKc1dFN0fbTkpczm7iR3T9pr8DaubK504kCD3gAAJ/Hcdt13i9VdTgs
    po3Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/w2B+Io="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-03.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.27.3 AUTH)
    with ESMTPSA id x09e06x5IC184kx
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Fri, 18 Jun 2021 14:01:08 +0200 (CEST)
Date:   Fri, 18 Jun 2021 14:01:08 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Message-ID: <1451402408.292378.1624017668638@webmail.strato.com>
In-Reply-To: <CAMuHMdWX+HxXMB63BKpHcCh7fXAJRt9LfMFjbqM+zEvrK31MfQ@mail.gmail.com>
References: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180925163337.31212-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWX+HxXMB63BKpHcCh7fXAJRt9LfMFjbqM+zEvrK31MfQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r8a77995: draak: Enable
 HDMI display output
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev25
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 06/18/2021 10:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Sep 25, 2018 at 6:34 PM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > From: Ulrich Hecht <uli+renesas@fpond.eu>
> >
> > Adds LVDS decoder, HDMI encoder and connector for the Draak board.
> >
> > The LVDS0 and LVDS1 encoders can use the DU_DOTCLKIN0, DU_DOTCLKIN1 and
> > EXTAL externals clocks. Two of them are provided to the SoC on the Draak
> > board, hook them up in DT.
> >
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> 
> > @@ -190,6 +225,43 @@
> >
> >         };
> >
> > +       hdmi-encoder@39 {
> > +               compatible = "adi,adv7511w";
> > +               reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
> > +               reg-names = "main", "edid", "packet", "cec";
> > +               interrupt-parent = <&gpio1>;
> > +               interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +               /* Depends on LVDS */
> > +               max-clock = <135000000>;
> > +               min-vrefresh = <50>;
> 
> Where do these two come from? They fail to validate with commit
> cfe34bb7a770c5d8 ("dt-bindings: drm: bridge: adi,adv7511.txt: convert
> to yaml").
> I can't find where it is used in the driver, nor in the driver history.

I have found a prototype patch in my archives that uses these properties. I guess the patch itself didn't make it into the final series, but the properties inadvertently did. I vaguely remember this was supposed to work around an issue with modes that use a higher clock than supported by one of the parts in the display pipeline.

I would say that if there are no issues with HDMI output, both the patch and the properties are obsolete.

For reference, this is the patch:

===snip===
From 8502e09a87a02216a195a985243e3e6567848154 Mon Sep 17 00:00:00 2001
From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Date: Thu, 7 Dec 2017 20:10:39 +0900
Subject: [PROTO][PATCH 05/10] drm/bridge: adv7511: Add max-clock, min-vrefresh
 options

This patch adds the option to specify a maximal clock and a minimal vertical
refresh rate.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[uli: renamed properties, fixed transposed parsing]
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  7 +++++++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 73d8ccb..7f29d4f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -271,6 +271,8 @@ enum adv7511_sync_polarity {
  * @sync_pulse:			Select the sync pulse
  * @vsync_polarity:		vsync input signal configuration
  * @hsync_polarity:		hsync input signal configuration
+ * @min_vrefresh_option:	min vrefresh option
+ * @max_freq_option:		max frequency option
  */
 struct adv7511_link_config {
 	unsigned int input_color_depth;
@@ -285,6 +287,9 @@ struct adv7511_link_config {
 	enum adv7511_input_sync_pulse sync_pulse;
 	enum adv7511_sync_polarity vsync_polarity;
 	enum adv7511_sync_polarity hsync_polarity;
+
+	unsigned int min_vrefresh_option;
+	unsigned int max_freq_option;
 };
 
 /**
@@ -354,6 +359,8 @@ struct adv7511 {
 	enum adv7511_sync_polarity vsync_polarity;
 	enum adv7511_sync_polarity hsync_polarity;
 	bool rgb;
+	unsigned int min_vref;
+	unsigned int max_freq;
 
 	struct gpio_desc *gpio_pd;
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 6437b87..2938b02 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -323,6 +323,8 @@ static void adv7511_set_link_config(struct adv7511 *adv7511,
 	adv7511->hsync_polarity = config->hsync_polarity;
 	adv7511->vsync_polarity = config->vsync_polarity;
 	adv7511->rgb = config->input_colorspace == HDMI_COLORSPACE_RGB;
+	adv7511->min_vref = config->min_vrefresh_option;
+	adv7511->max_freq = config->max_freq_option;
 }
 
 static void __adv7511_power_on(struct adv7511 *adv7511)
@@ -660,6 +662,16 @@ static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511,
 	if (mode->clock > 165000)
 		return MODE_CLOCK_HIGH;
 
+	if (adv7511->max_freq) {
+		if (mode->clock > (adv7511->max_freq / 1000))
+			return MODE_CLOCK_HIGH;
+	}
+
+	if (adv7511->min_vref) {
+		if (drm_mode_vrefresh(mode) < adv7511->min_vref)
+			return MODE_BAD;
+	}
+
 	return MODE_OK;
 }
 
@@ -1074,6 +1086,16 @@ static int adv7511_parse_dt(struct device_node *np,
 	config->vsync_polarity = ADV7511_SYNC_POLARITY_PASSTHROUGH;
 	config->hsync_polarity = ADV7511_SYNC_POLARITY_PASSTHROUGH;
 
+	ret = of_property_read_u32(np, "max-clock",
+				   &config->max_freq_option);
+	if (ret < 0)
+		config->max_freq_option = 0;
+
+	ret = of_property_read_u32(np, "min-vrefresh",
+				   &config->min_vrefresh_option);
+	if (ret < 0)
+		config->min_vrefresh_option = 0;
+
 	return 0;
 }
 
-- 
2.7.4
===snip===

CU
Uli
