Return-Path: <linux-renesas-soc+bounces-27497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLreATVLeWmXwQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 00:33:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2FF9B6AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 00:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10638300C019
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 23:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98AA2D838B;
	Tue, 27 Jan 2026 23:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="b9xim2K2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469E1284689;
	Tue, 27 Jan 2026 23:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769556784; cv=none; b=B/O89BFeJorPL4DPopncTrGhmB1SOY4pBEyjCo4QtwPkLr2e2gQhYI4EtrJjqCNV0ZsNzkMPDILdaaTTr3JoGjpjyRMFkCpWghJYOGA9gv3+FCpkDHj4VEw7YNtaUlmYctTZ135wa+It1fIG3M0io1WKjgY0R5JUo8mMf7Q4VJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769556784; c=relaxed/simple;
	bh=rhkKh1SBzCXoXG7SVDKmB/jKb7xuj3po6LOiKqWa68U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RmDTQM3yEqVTdsV19XNPK8B9yJy74rlWMpJ1e2mOxTS1viLLDRcfaRXwNJnh7aK7HhqhHCaGaK45Yp9w07qTHlK7xFGeI+fG4qKDhlW+JkRbmfYL99PUrXuSehgrR9xplv7UxxcxPvqx9BcOvJ9s693eS8WN7gwOtOPJYEG2Py8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=b9xim2K2; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=A1zsHfiNLCHLmtqqqqKp7hDFVmzRNEb7rbTIgSMglMw=; b=b9xim2K2nVlbvrHo3L8VefwrdU
	r0qocpG0zh6pTRG3uIFgfCa2qil0N8/1bb8cTeMJXAhVo5Xg3W2tsVEC1L8AwJOECRFzebkVUEP3o
	B2TIQ1JXThZ5w/B2YH3kqJ/giPH21r4v4av0f/rVZt41Ezg+fiu08IM/ICAtW27WDCNunvAFwdEp6
	gzNDapjLWQguEU1nFwnImxk5zn5hekHl+111wvzpGjSxzPzhxZAaOmnH+Qa5jUUdsUfbUFFWbF40q
	PPzK0fVyTxuTsnucS/ztbXysjjitdzH4ZI13kswi9Ojw6A0NWvC84qWKOzzD5F5HOJXeYtnq/P8p/
	XDpNystQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1vks9c-000ICe-3D;
	Wed, 28 Jan 2026 00:07:25 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1vks9c-000Gf3-15;
	Wed, 28 Jan 2026 00:07:24 +0100
Message-ID: <5b1615aeb8a4a7ee5f46a23f148416ec2398bc10.camel@apitzsch.eu>
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Rob Herring <robh@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier	
 <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Arnaud Pouliquen	
 <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, Beleswar Padhi
	 <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 	linux-arm-msm@vger.kernel.org
Date: Wed, 28 Jan 2026 00:07:21 +0100
In-Reply-To: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
References: <20251124182751.507624-1-robh@kernel.org>
	 <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
	 <20251124182751.507624-2-robh@kernel.org>
	 <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
	 <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27893/Tue Jan 27 08:24:09 2026)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[apitzsch.eu:s=default2410];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27497-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[apitzsch.eu];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,glider.be,foss.st.com,nxp.com,ti.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[apitzsch.eu:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[git@apitzsch.eu,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[5.42.239.224:email,5.44.118.128:email,5.39.226.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5.32.65.128:email,5.42.161.192:email,5.36.213.96:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,5.38.92.0:email,samsung.com:email]
X-Rspamd-Queue-Id: 9A2FF9B6AF
X-Rspamd-Action: no action

Hi Rob,

Am Dienstag, dem 02.12.2025 um 08:15 -0600 schrieb Rob Herring:
> On Thu, Nov 27, 2025 at 8:28=E2=80=AFAM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >=20
> > Hi Rob,
> >=20
> > On 24.11.2025 19:27, Rob Herring (Arm) wrote:
> > > Use the newly added of_reserved_mem_region_to_resource() and
> > > of_reserved_mem_region_count() functions to handle "memory-
> > > region" properties.
> > >=20
> > > The error handling is a bit different in some cases. Often
> > > "memory-region" is optional, so failed lookup is not an error.
> > > But then an error in of_reserved_mem_lookup() is treated as an
> > > error.
> > > However, that distinction is not really important. Either the
> > > region is available and usable or it is not. So now, it is just
> > > of_reserved_mem_region_to_resource() which is checked for an
> > > error.
> > >=20
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >=20
> > This patch landed in today's linux-next as commit c70b9d5fdcd7
> > ("remoteproc: qcom: Use of_reserved_mem_region_* functions for
> > "memory-region""). In my tests I found that it breaks booting of
> > DragonBoard410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts) by
> > causing the NULL pointer dereference. The issue is caused by
> > replacing devm_ioremap_wc() with devm_ioremap_resource_wc(), which
> > fails on devm_request_mem_region(), see comment in the code below.
> > It looks that the error handling is somewhere broken. Here is the
> > the kernel log:
> >=20
> > remoteproc remoteproc0: 4080000.remoteproc is available
> > qcom-wcnss-pil a204000.remoteproc: error -EBUSY: can't request
> > region for resource [mem 0x8e200000-0x8e7fffff]
> > remoteproc remoteproc1: a204000.remoteproc is available
> > remoteproc remoteproc1: powering up a204000.remoteproc
> > remoteproc remoteproc1: Booting fw image qcom/apq8016/wcnss.mbn,
> > size 4111376
> > Unable to handle kernel paging request at virtual address
> > fffffffffffffff0
> > Mem abort info:
> > ...
> > Internal error: Oops: 0000000096000046 [#1]=C2=A0 SMP
> > Modules linked in: cpufreq_powersave qcom_wcnss_pil
> > cpufreq_conservative
> > coresight_stm coresight_replicator coresight_tmc coresight_tpiu
> > stm_core
> > coresight_funnel coresight_cpu_debug coresight_cti(+) adv7511
> > coresight
> > nfc rfkill msm snd_soc_lpass_apq8016 snd_soc_apq8016_sbc
> > snd_soc_lpass_cpu snd_soc_msm8916_analog snd_soc_msm8916_digital
> > snd_soc_qcom_common snd_soc_lpass_platform snd_soc_core qrtr
> > ubwc_config
> > snd_compress llcc_qcom snd_pcm_dmaengine qcom_q6v5_mss snd_pcm
> > ocmem
> > qcom_pil_info qcom_spmi_vadc qcom_camss drm_gpuvm qcom_pon
> > rtc_pm8xxx
> > qcom_q6v5 qcom_spmi_temp_alarm venus_core qcom_vadc_common
> > snd_timer
> > drm_exec qcom_sysmon snd qcom_common gpu_sched videobuf2_dma_sg
> > v4l2_mem2mem qcom_glink_smem v4l2_fwnode soundcore drm_dp_aux_bus
> > qmi_helpers mdt_loader v4l2_async videobuf2_memops videobuf2_v4l2
> > videodev qnoc_msm8916 videobuf2_common qcom_rng drm_display_helper
> > mc
> > qcom_stats rpmsg_ctrl rpmsg_char display_connector ramoops socinfo
> > rmtfs_mem reed_solomon ax88796b asix usbnet phy_qcom_usb_hs ipv6
> > libsha1
> > CPU: 2 UID: 0 PID: 28 Comm: kworker/2:0 Tainted: G W
> > 6.18.0-rc1+ #16209 PREEMPT
> > Tainted: [W]=3DWARN
> > lr : __qcom_mdt_load+0x210/0x304 [mdt_loader]
> > Call trace:
> > =C2=A0 __pi_memcpy_generic+0x128/0x22c (P)
> > =C2=A0 qcom_mdt_load+0x68/0x60c [mdt_loader]
> > =C2=A0 wcnss_load+0x2c/0x5c [qcom_wcnss_pil]
> > =C2=A0 rproc_start+0x30/0x1b4
> > =C2=A0 rproc_boot+0x19c/0x560
> > =C2=A0 rproc_auto_boot_callback+0x1c/0x34
> > =C2=A0 request_firmware_work_func+0x4c/0x98
> > =C2=A0 process_one_work+0x208/0x60c
> > =C2=A0 worker_thread+0x244/0x388
> > =C2=A0 kthread+0x150/0x228
> > =C2=A0 ret_from_fork+0x10/0x20
> > Code: 927cec03 cb0e0021 8b0e0042 a9411c26 (a900340c)
> > ---[ end trace 0000000000000000 ]---
> >=20
> >=20
> > > ---
> > > v7:
> > > =C2=A0 - Split QCom to separate patch
> > > ---
> > > =C2=A0 drivers/remoteproc/qcom_q6v5_adsp.c | 24 ++++------
> > > =C2=A0 drivers/remoteproc/qcom_q6v5_mss.c=C2=A0 | 60 ++++++++--------=
------
> > > ---
> > > =C2=A0 drivers/remoteproc/qcom_q6v5_pas.c=C2=A0 | 69 +++++++++++-----=
------
> > > -------
> > > =C2=A0 drivers/remoteproc/qcom_q6v5_wcss.c | 25 +++++------
> > > =C2=A0 drivers/remoteproc/qcom_wcnss.c=C2=A0=C2=A0=C2=A0=C2=A0 | 23 +=
+++------
> > > =C2=A0 5 files changed, 72 insertions(+), 129 deletions(-)
> > >=20
> >=20
> > > ...
> >=20
> > > diff --git a/drivers/remoteproc/qcom_wcnss.c
> > > b/drivers/remoteproc/qcom_wcnss.c
> > > index 2c7e519a2254..14005fb049a2 100644
> > > --- a/drivers/remoteproc/qcom_wcnss.c
> > > +++ b/drivers/remoteproc/qcom_wcnss.c
> > > @@ -526,25 +526,20 @@ static int wcnss_request_irq(struct
> > > qcom_wcnss *wcnss,
> > >=20
> > > =C2=A0 static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
> > > =C2=A0 {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 struct reserved_mem *rmem =3D NULL;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 struct device_node *node;
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 node =3D of_parse_phandle(wcnss->dev->of_no=
de, "memory-
> > > region", 0);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 if (node)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 rmem =3D of_reserved_mem_lookup(node);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 of_node_put(node);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 struct resource res;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 if (!rmem) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D of_reserved_mem_region_to_resource(=
wcnss->dev-
> > > >of_node, 0, &res);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dev_err(wcnss->dev, "unable to resolve memory-
> > > region\n");
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ret;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 wcnss->mem_phys =3D wcnss->mem_reloc =3D rm=
em->base;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 wcnss->mem_size =3D rmem->size;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0 wcnss->mem_region =3D devm_ioremap_wc(wcnss=
->dev, wcnss-
> > > >mem_phys, wcnss->mem_size);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 wcnss->mem_phys =3D wcnss->mem_reloc =3D re=
s.start;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 wcnss->mem_size =3D resource_size(&res);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 wcnss->mem_region =3D devm_ioremap_resource=
_wc(wcnss->dev,
> > > &res);
> >=20
> > The above line causes the failure. After restoring it to:
> >=20
> > wcnss->mem_region =3D devm_ioremap_wc(wcnss->dev, wcnss->mem_phys,
> > wcnss->mem_size);
> >=20
> > the mentioned board boots fine again. I'm not sure about other
> > drivers,
> > if they also fail the same way as they might not be used on the
> > tested
> > board.
>=20
> Other platforms (non-QCom) were tested also use
> devm_ioremap_resource_wc(). So something else is claiming the same
> region? Can you dump out /proc/iomem?
>=20
> The region is dynamically allocated, so maybe that has something to
> do with it.
>=20
> Rob

the problem seems to persist with 6.19-rc7. On qcom/msm8939-longcheer-
l9100 (msm8916-based) I still get:

> remoteproc remoteproc0: 4080000.remoteproc is available
> qcom-wcnss-pil a204000.remoteproc: error -EBUSY: can't request region for=
 resource [mem 0x8e200000-0x8e7fffff]
> qcom-wcnss-pil a204000.remoteproc: unable to map memory region: [mem 0x8e=
200000-0x8e7fffff]
> qcom-wcnss-pil a204000.remoteproc: probe with driver qcom-wcnss-pil faile=
d with error -16
> remoteproc remoteproc1: releasing a204000.remoteproc

Maybe parts of your patch should be reverted (as suggested by Marek),
to fix the regression (i.e. wifi not working) until a proper fix is
found.


On msm8939-longcheer-l9100 the reserved memory regions look similar to
the ones provided by Marek:

# dmesg | grep mem
OF: reserved mem: 0x000000008e200000..0x000000008e7fffff (6144 KiB)
nomap non-reusable wcnss
OF: reserved mem: 0x000000008e100000..0x000000008e1fffff (1024 KiB)
nomap non-reusable mba
OF: reserved mem: 0x000000008df00000..0x000000008e0fffff (2048 KiB)
nomap non-reusable gps
OF: reserved mem: 0x0000000086000000..0x00000000862fffff (3072 KiB)
nomap non-reusable tz-apps@86000000
OF: reserved mem: 0x0000000086300000..0x00000000863fffff (1024 KiB)
nomap non-reusable smem@86300000
OF: reserved mem: 0x0000000086400000..0x00000000864fffff (1024 KiB)
nomap non-reusable hypervisor@86400000
OF: reserved mem: 0x0000000086500000..0x000000008667ffff (1536 KiB)
nomap non-reusable tz@86500000
OF: reserved mem: 0x0000000086680000..0x00000000866fffff (512 KiB)
nomap non-reusable reserved@86680000
OF: reserved mem: 0x0000000086700000..0x00000000867dffff (896 KiB)
nomap non-reusable rmtfs@86700000
OF: reserved mem: 0x00000000867e0000..0x00000000867fffff (128 KiB)
nomap non-reusable rfsa@867e0000
OF: reserved mem: 0x0000000086800000..0x000000008b7fffff (81920 KiB)
nomap non-reusable mpss@86800000
  DMA      [mem 0x0000000040000000-0x00000000ffffffff]
Early memory node ranges
  node   0: [mem 0x0000000040000000-0x0000000085ffffff]
  node   0: [mem 0x0000000086000000-0x000000008b7fffff]
  node   0: [mem 0x000000008b800000-0x000000008defffff]
  node   0: [mem 0x000000008df00000-0x000000008e7fffff]
  node   0: [mem 0x000000008e800000-0x00000000ffffffff]
Initmem setup node 0 [mem 0x0000000040000000-0x00000000ffffffff]
software IO TLB: mapped [mem 0x00000000fae00000-0x00000000fb200000]
(4MB)
...

# cat /proc/iomem
...
40000000-85ffffff : System RAM
  40000000-410fffff : Kernel code
  41100000-412bffff : reserved
  412c0000-4154ffff : Kernel data
  42000000-4200dfff : reserved
  42200000-42c98fff : reserved
86000000-8b7fffff : reserved
8b800000-8defffff : System RAM
8df00000-8e7fffff : reserved
  8df00000-8e7fffff : reserved
8e800000-ffffffff : System RAM
  fae00000-ff7fffff : reserved
  ff8ac000-ff8b7fff : reserved
  ff8b8000-ff8b9fff : reserved
  ff8ba000-ff9c1fff : reserved
  ff9c3000-ff9c6fff : reserved
  ff9c7000-ff9d7fff : reserved
  ff9d8000-ffa33fff : reserved
  ffa34000-ffffffff : reserved

Best regards,
Andr=C3=A9

