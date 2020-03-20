Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31BE18D4E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 17:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgCTQvf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 12:51:35 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34497 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTQve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 12:51:34 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhDEo-1jkWwx2Igk-00eKs8 for <linux-renesas-soc@vger.kernel.org>; Fri, 20
 Mar 2020 17:51:33 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 557DE64FD0A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 16:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yb4ED3GHAL-H for <linux-renesas-soc@vger.kernel.org>;
        Fri, 20 Mar 2020 17:51:33 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 0AD2264FB26
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 17:51:33 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:51:32 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 86EAC80509; Fri, 20 Mar 2020 17:12:06 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:06 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 11/11] media: adv748x: allow the HDMI sub-device to accept
 EDID
Message-ID: <4fce566b68bbe4f85cf92cd80a455b575a5d95d1.1584720678.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:GNVm/Wggw3N1zzuf7M6xHBIw+alFhZe457KWN5272jVQ9hcWtNm
 Tn0nfryvybDfn16+JA9YLWxmpgwcWQdsZjd+DJCUwnYw6pqt4AG90gpnIQ1LxTgy/ZrQdAY
 q2jPigLkwHlBPRm6X3s9FzR/rmyAGnun+H9XlbnEVpC0W+lo26C4807AGJP6luTIc7qUvKz
 pXreJsAl/soX8CZYVcFdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SQQNCIC8B5M=:wotCBf6fyXY7wfVfGDKFBF
 vQqfoDzJzra+KhLhuQ+1S91M7gmRh9T9/jcYRy6aNIgnU95eOMkCiEhkdYVYtFjU/xEHLq3ak
 vEXjXF9RzWZCDHNaNvItb/E3uxi6y4p89M2/5pb7HjfQJJLLww6j64yoO7FPYGECb+60BQo8k
 YSg1c4GXzK6Xljm8749KlBcTugkRQHvP1ndEo4JanW8xsdFoBSXETfKS1IRW83FIlBHr1gpx2
 IhcKGGJbJABdXcb/WDRDJFtMH0r2e5tOjB2wXzomQSOeVvlVKM2epWf6yF+ukopwACWBHCSzQ
 dwtFgWW+hAUwaJyhRIWZWw/418+z/l0gdT7RAqBkmUYPJUj0uEcD63fJbCBx2VTYXc4bN8rUf
 rydwv4eyxGH1UYM69Pj0miMFbJtCYUaAYVS5/a5MxZesc5dEbHaZa5Nz2Ukk5pIWjMsZarr4M
 p5cnDw4b61NV5sNepCcMmusKyhLjEJA/13iNRLI2rhpz/fislf9eYubuPfjpE5QlISaFacP1K
 hdoqSXHjfBS0bP76oKs3wxsAnQh6Urtr6jPpkswv4HbvNgX7s4wUpdyns3h2Lf03xv/aaKWpX
 qzdc7T66SdQIu7G6XxujDFj16OWtm3pZVqBIIqHjpuB6q7flh7vpJNVB3sEi/DtibecwvGWgk
 61XI533zyYqA4wbVUkWxP1+Kka5jD1yDzFMJFHKD547TGwwnFNq1dzVUyvo3EpS6cMKm6t2yA
 MdrhxdZdTI6sA2lBuBRB0T4k1KdJPBtUA124yr3g6hj6HtJx84pmJ+nvJ/5ZVfPr66ZekWT9k
 EHaGL/bVLy767sAl/q5QkGIvFn9PWoADqHdOE9ih7OoaTqBzp+rt42S08MMBiJmc9Z9SIlR
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This makes it possible to load a EDID reported by the device
with v4l2-ctl utility:

  vdev=/dev/$(grep -l '^adv748x.*hdmi$' /sys/class/video4linux/v4l-subdev*/name |cut -d/ -f5-5)
  v4l2-ctl -d $vdev --set-edid=pad=0,file=/etc/adv7482.edid

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>

--

I would like to avoid doing that, but found no other way yet.
Suggestions very welcome.
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 664930e55baf..fea133472911 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -775,7 +775,34 @@ static int adv748x_hdmi_log_status(struct v4l2_subdev *sd)
 	return 0;
 }
 
+static long adv748x_hdmi_querycap(struct adv748x_hdmi *hdmi,
+				  struct v4l2_capability *cap)
+{
+	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
+
+	cap->version = LINUX_VERSION_CODE;
+	strlcpy(cap->driver, state->dev->driver->name, sizeof(cap->driver));
+	strlcpy(cap->card, "hdmi", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "i2c:%d-%04x",
+		 i2c_adapter_id(state->client->adapter),
+		 state->client->addr);
+	cap->device_caps = V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
+	cap->capabilities = V4L2_CAP_DEVICE_CAPS;
+	return 0;
+}
+
+static long adv748x_hdmi_ioctl(struct v4l2_subdev *sd,
+			       unsigned int cmd, void *arg)
+{
+	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
+
+	if (cmd == VIDIOC_QUERYCAP)
+		return adv748x_hdmi_querycap(hdmi, arg);
+	return -ENOTTY;
+}
+
 static const struct v4l2_subdev_core_ops adv748x_core_ops_hdmi = {
+	.ioctl = adv748x_hdmi_ioctl,
 	.log_status = adv748x_hdmi_log_status,
 };
 
-- 
2.25.1.25.g9ecbe7eb18

