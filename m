Return-Path: <linux-renesas-soc+bounces-25493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A90C9BBDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 15:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD533A2247
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 14:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E91D21578F;
	Tue,  2 Dec 2025 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oS2mkVPH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1615A1F131A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684937; cv=none; b=IR3q6mA+pmBMbRda7iwIjOQvXXdHFHYeqaMz7tqvYO2TGwXjg1SMH9/BKaRB2SKCyRM0Zy12JJ2w2/LrAjj6V2AexmrFMc8PKJrSHTnqv/5sSW9N+umnQxjTinFXcHA2zEHruccXscEpq3DNXUnB8sqeq5BGxEQDY2yt3Y/gKXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684937; c=relaxed/simple;
	bh=4Wc48KRaIcqiX0vglMdyQboI7iIQ2x8CgSCV7WOL/hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9cYUUGQTwN2QYfSTnJfeb1BUJwC1g4HX+qGA7FFI9ICjw1EsSphE4o4R/D+dc/nf/vOYVICu4OcuU5JBu+vOQYmUGu6VW80CXLV7agPZjY9erB2EFQ3Otwg6DCtxTaZxQEWqCO00iSLCoD2YkcLIXguwOZqm/0pBRa386WpqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS2mkVPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CFAC19422
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764684936;
	bh=4Wc48KRaIcqiX0vglMdyQboI7iIQ2x8CgSCV7WOL/hs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oS2mkVPHrpV8sWUwH+Q0AJ0ClWDtVr/T+8Z9ZI+6iedRlqKw4FAuwSCb5BfkSlgJN
	 SqCVRql5CR+IxwmmKB87Usk2+iZkbCoEdljR0q4TOSCRcY2HH3VxAZIWWfiDvv2973
	 6HaDODJFFN5V0Ovs3P3G2ZNgu8QnR+YYgP5S6MEfDUyRaMV+vOrpfegKEG5h1sIQ4U
	 2A9C9rNoxXy4cF1lPEO/thcP/a17WAEeWOUsE+irpkdDfF1e3WqjeJ3k/TDT2U5AfO
	 yp8DS3LMrMuWjX5BddfjIf3dgMScZVeOJA7+yJE8gMGqEXpMADVWUNxOdiboptIWBw
	 6n3oljKWqG0VA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso8623917a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Dec 2025 06:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUd6TI/KM2cOu7k13SZmEOwdGKDBrAvfDLziwDFUut33pGut/UW7yhlVSNduluSJ3OcFdJW4w0k1pjTG8g7d+ShGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS7agL4X9s74sN13uNPUevPPM7Xg9xEVGj0U713TLc7ZKB3vI9
	fqZCL2rbABbOkPkDXbBCE318aXEJYujL1vZPLk8H3XK5sTPLn3DkEahb1N6nyQfrINcrjiXdZtR
	NaCyBEqifiHoXtl/MZv9h8wi/fkh5WQ==
X-Google-Smtp-Source: AGHT+IHOK37x0Kt35joRUOghP+Y+b/h+dUlhViPYEEU5vZFEgzun82hvWA1eFjAbdPJqCcazIpiBmOYOIRh+oi7lQBk=
X-Received: by 2002:a05:6402:51c9:b0:647:6589:516f with SMTP id
 4fb4d7f45d1cf-647658951c8mr11422163a12.23.1764684935180; Tue, 02 Dec 2025
 06:15:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124182751.507624-1-robh@kernel.org> <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
 <20251124182751.507624-2-robh@kernel.org> <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
In-Reply-To: <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Dec 2025 08:15:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
X-Gm-Features: AWmQ_blpHLPsU5za5Q3_8cThmj1tfuI1sEcIZQQrDepEj9pfYTWSHFtibfJZbEw
Message-ID: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 8:28=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Rob,
>
> On 24.11.2025 19:27, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() and
> > of_reserved_mem_region_count() functions to handle "memory-region"
> > properties.
> >
> > The error handling is a bit different in some cases. Often
> > "memory-region" is optional, so failed lookup is not an error. But then
> > an error in of_reserved_mem_lookup() is treated as an error. However,
> > that distinction is not really important. Either the region is availabl=
e
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> This patch landed in today's linux-next as commit c70b9d5fdcd7
> ("remoteproc: qcom: Use of_reserved_mem_region_* functions for
> "memory-region""). In my tests I found that it breaks booting of
> DragonBoard410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts) by causing
> the NULL pointer dereference. The issue is caused by replacing
> devm_ioremap_wc() with devm_ioremap_resource_wc(), which fails on
> devm_request_mem_region(), see comment in the code below. It looks that
> the error handling is somewhere broken. Here is the the kernel log:
>
> remoteproc remoteproc0: 4080000.remoteproc is available
> qcom-wcnss-pil a204000.remoteproc: error -EBUSY: can't request region
> for resource [mem 0x8e200000-0x8e7fffff]
> remoteproc remoteproc1: a204000.remoteproc is available
> remoteproc remoteproc1: powering up a204000.remoteproc
> remoteproc remoteproc1: Booting fw image qcom/apq8016/wcnss.mbn, size
> 4111376
> Unable to handle kernel paging request at virtual address fffffffffffffff=
0
> Mem abort info:
> ...
> Internal error: Oops: 0000000096000046 [#1]  SMP
> Modules linked in: cpufreq_powersave qcom_wcnss_pil cpufreq_conservative
> coresight_stm coresight_replicator coresight_tmc coresight_tpiu stm_core
> coresight_funnel coresight_cpu_debug coresight_cti(+) adv7511 coresight
> nfc rfkill msm snd_soc_lpass_apq8016 snd_soc_apq8016_sbc
> snd_soc_lpass_cpu snd_soc_msm8916_analog snd_soc_msm8916_digital
> snd_soc_qcom_common snd_soc_lpass_platform snd_soc_core qrtr ubwc_config
> snd_compress llcc_qcom snd_pcm_dmaengine qcom_q6v5_mss snd_pcm ocmem
> qcom_pil_info qcom_spmi_vadc qcom_camss drm_gpuvm qcom_pon rtc_pm8xxx
> qcom_q6v5 qcom_spmi_temp_alarm venus_core qcom_vadc_common snd_timer
> drm_exec qcom_sysmon snd qcom_common gpu_sched videobuf2_dma_sg
> v4l2_mem2mem qcom_glink_smem v4l2_fwnode soundcore drm_dp_aux_bus
> qmi_helpers mdt_loader v4l2_async videobuf2_memops videobuf2_v4l2
> videodev qnoc_msm8916 videobuf2_common qcom_rng drm_display_helper mc
> qcom_stats rpmsg_ctrl rpmsg_char display_connector ramoops socinfo
> rmtfs_mem reed_solomon ax88796b asix usbnet phy_qcom_usb_hs ipv6 libsha1
> CPU: 2 UID: 0 PID: 28 Comm: kworker/2:0 Tainted: G W
> 6.18.0-rc1+ #16209 PREEMPT
> Tainted: [W]=3DWARN
> lr : __qcom_mdt_load+0x210/0x304 [mdt_loader]
> Call trace:
>   __pi_memcpy_generic+0x128/0x22c (P)
>   qcom_mdt_load+0x68/0x60c [mdt_loader]
>   wcnss_load+0x2c/0x5c [qcom_wcnss_pil]
>   rproc_start+0x30/0x1b4
>   rproc_boot+0x19c/0x560
>   rproc_auto_boot_callback+0x1c/0x34
>   request_firmware_work_func+0x4c/0x98
>   process_one_work+0x208/0x60c
>   worker_thread+0x244/0x388
>   kthread+0x150/0x228
>   ret_from_fork+0x10/0x20
> Code: 927cec03 cb0e0021 8b0e0042 a9411c26 (a900340c)
> ---[ end trace 0000000000000000 ]---
>
>
> > ---
> > v7:
> >   - Split QCom to separate patch
> > ---
> >   drivers/remoteproc/qcom_q6v5_adsp.c | 24 ++++------
> >   drivers/remoteproc/qcom_q6v5_mss.c  | 60 ++++++++-----------------
> >   drivers/remoteproc/qcom_q6v5_pas.c  | 69 +++++++++++-----------------=
-
> >   drivers/remoteproc/qcom_q6v5_wcss.c | 25 +++++------
> >   drivers/remoteproc/qcom_wcnss.c     | 23 ++++------
> >   5 files changed, 72 insertions(+), 129 deletions(-)
> >
>
> > ...
>
> > diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_=
wcnss.c
> > index 2c7e519a2254..14005fb049a2 100644
> > --- a/drivers/remoteproc/qcom_wcnss.c
> > +++ b/drivers/remoteproc/qcom_wcnss.c
> > @@ -526,25 +526,20 @@ static int wcnss_request_irq(struct qcom_wcnss *w=
cnss,
> >
> >   static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
> >   {
> > -     struct reserved_mem *rmem =3D NULL;
> > -     struct device_node *node;
> > -
> > -     node =3D of_parse_phandle(wcnss->dev->of_node, "memory-region", 0=
);
> > -     if (node)
> > -             rmem =3D of_reserved_mem_lookup(node);
> > -     of_node_put(node);
> > +     struct resource res;
> > +     int ret;
> >
> > -     if (!rmem) {
> > +     ret =3D of_reserved_mem_region_to_resource(wcnss->dev->of_node, 0=
, &res);
> > +     if (ret) {
> >               dev_err(wcnss->dev, "unable to resolve memory-region\n");
> > -             return -EINVAL;
> > +             return ret;
> >       }
> >
> > -     wcnss->mem_phys =3D wcnss->mem_reloc =3D rmem->base;
> > -     wcnss->mem_size =3D rmem->size;
> > -     wcnss->mem_region =3D devm_ioremap_wc(wcnss->dev, wcnss->mem_phys=
, wcnss->mem_size);
> > +     wcnss->mem_phys =3D wcnss->mem_reloc =3D res.start;
> > +     wcnss->mem_size =3D resource_size(&res);
> > +     wcnss->mem_region =3D devm_ioremap_resource_wc(wcnss->dev, &res);
>
> The above line causes the failure. After restoring it to:
>
> wcnss->mem_region =3D devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss-=
>mem_size);
>
> the mentioned board boots fine again. I'm not sure about other drivers,
> if they also fail the same way as they might not be used on the tested
> board.

Other platforms (non-QCom) were tested also use
devm_ioremap_resource_wc(). So something else is claiming the same
region? Can you dump out /proc/iomem?

The region is dynamically allocated, so maybe that has something to do with=
 it.

Rob

