Return-Path: <linux-renesas-soc+bounces-30312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FOIGsH0xGld5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:56:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 05779331B79
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB0D7302A0F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 08:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5755E3AF64B;
	Thu, 26 Mar 2026 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iEAGnl2V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC6428314C;
	Thu, 26 Mar 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515333; cv=none; b=GN1PSBlJLKxgCdha4w7Pm1om0drBp59m19Gu5twz0Bz8Uc5CuH6u97Nbh9OSIeXwa/kXa+/iqJcdcjim/i91NdXOSgzV43YB5kvbaSA3rb/K1CvHzaoAcfBp2R4GounC6DGpHAi//HESRjKv9IyZ6mJzI4dvOfGly8qkai+eihk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515333; c=relaxed/simple;
	bh=eYd+rt4Ybh+8fIo14ss1tVAEBWWEIGFqk9TPJNkQ8Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsPkzNueGpN1vd0ZoS2Xn52RfNPm0l0L+yYJFZX2fP/Yl9kSN1tP0VO/3anORR1gHi1XlTGs/ceaG9KCSRE+7DupIIIeRBS1W2X1dm+bJyglSisNBd55piG/fzvNBVZzRWYV5kDCpR5i9jS2M8rwRgK+j2ZUnwKOcevzgZwf9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iEAGnl2V; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=16+VF+5NHe0xa6HKIQJNpMGjFD6+6C6+LsFOsle4G8I=; b=iEAGnl2VulXKw6ECzvCLf8JTFu
	tXygYWgoPUrKW0tfgmjj4Tw+qE0vUIKYTj7zEwbGhXAPicnyPggeBdLeOXbL2hnVllkggz8WvMqNY
	WOMACd0OLcDD8f9uIBq4/PcVKPe5xU+HH80+sUn09sBlfI9TaSpo8t5tSvBrftoq7qvE1YKu89xmG
	oZBw2yfgr4WknsgL5VXZfcifqg1hBtnd884r4B2L9Ycm85ZKB1ADkpWA24h+fhIsIkU7YOS5I9ERh
	bfY70C36/SRc83nVdCfPoZzSVfwHyb4shU/+k/iUhyPRuiz3eKUx4UlQYJVoOrfQ0vXevMcYmUVEY
	tcYob3vw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5gUq-000Lpa-1r;
	Thu, 26 Mar 2026 09:55:20 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5gUp-0005Ky-2v;
	Thu, 26 Mar 2026 09:55:19 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org,
 etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
 dan.carpenter@linaro.org, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject:
 Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
Date: Thu, 26 Mar 2026 09:55:18 +0100
Message-ID: <5980695.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <acPUxJ3N0QptmtlJ@pluto>
References:
 <20260310184030.3669330-1-cristian.marussi@arm.com>
 <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com> <acPUxJ3N0QptmtlJ@pluto>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27952/Thu Mar 26 07:24:52 2026)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30312-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,ew.tq-group.com:dkim]
X-Rspamd-Queue-Id: 05779331B79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Am Mittwoch, 25. M=E4rz 2026, 13:27:48 CET schrieb Cristian Marussi:
> On Wed, Mar 25, 2026 at 12:02:41PM +0100, Marek Szyprowski wrote:
> > On 10.03.2026 19:40, Cristian Marussi wrote:
> > > Add proper error handling on failure to enumerate clocks features or
> > > rates.
> > >
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >=20
>=20
> Hi Marek,
>=20
> > This patch landed yesterday in linux-next as commit 0d8b0c8068a8=20
> > ("firmware: arm_scmi: Harden clock protocol initialization"). In my=20
> > tests I found that it causes a regression on RK3568 Odroid-M1 board=20
> > (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts), cpufreq and GPU=20
> > device are not probed properly:
> >=20
> > # dmesg | grep scmi
> > scmi_core: SCMI protocol bus registered
> > arm-scmi arm-scmi.0.auto: Using scmi_smc_transport
> > arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size:=20
> > 104bytes / max-msg: 20
> > scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
> > arm-scmi arm-scmi.0.auto: SCMI Notifications - Core Enabled.
> > arm-scmi arm-scmi.0.auto: Malformed reply - real_sz:8 calc_sz:4 =20
> > (loop_num_ret:1)
> > arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'rockchip:' Firmware=20
> > version 0x0
> > arm-scmi arm-scmi.0.auto: Enabling SCMI Quirk=20
> > [quirk_clock_rates_triplet_out_of_spec]
> > scmi-clocks scmi_dev.3: probe with driver scmi-clocks failed with error=
 -22
> >=20
>=20
> Yes there are multiple reports of issues on this hardening, the series
> is on hold and wont go into v7.1 as of now...it needs some basic fixes
> and various quirks probably to address non-compliant firmwares...
>=20
> It will be pushed to next again with a few more fixes in the coming
> days and then we'll need to figure out how many quirks will be needed on
> top of that and if it is acceptable at all...

Just for the records: imx95 (maybe imx94 as well) is also affected by this.
My board doesn't boot at all, because all the clocks are provided by SCMI.

With this diff I can see it's the 'ext' clock
=2D->8---
=2D-- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1253,8 +1253,11 @@ static int scmi_clock_protocol_init(const struct scm=
i_protocol_handle *ph)
        for (clkid =3D 0; clkid < cinfo->num_clocks; clkid++) {
                cinfo->clkds[clkid].id =3D clkid;
                ret =3D scmi_clock_attributes_get(ph, clkid, cinfo);
=2D               if (ret)
+               if (ret) {
+                       dev_warn(ph->dev, "scmi_clock_attributes_get failed=
 for '%s': %d\n",
+                                cinfo->clkds->info.name, ret);
                        return ret;
+               }
=20
                ret =3D scmi_clock_describe_rates_get(ph, clkid, cinfo);
                if (ret)
=2D->8---
> arm-scmi arm-scmi.0.auto: scmi_clock_attributes_get failed for 'ext': -2
> scmi-clocks scmi_dev.6: probe with driver scmi-clocks failed with error -2

What's the idea of how to proceeed as apparently several platforms are
affected?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



