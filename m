Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49961F72CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 06:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFLESR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 00:18:17 -0400
Received: from mail-eopbgr1310134.outbound.protection.outlook.com ([40.107.131.134]:52352
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725947AbgFLESR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 00:18:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNIMhZF0hiuKGYz/w7awG2jL08f21n+mi8sF3zAsTdZeJKmlPTNhQjpYTZfyNXwByVSb2fnOj01TGKwGrpS1ix/TrnIF3Tn+2ncpNu1rP5VlzQZjNCILcOVRS5bcXct4rwLs7OQ2cINRItWRmg+lzqG5D9eeQKKfLysEJmILW0dm5tjS/U0NJ2Xo2hMOLvVMffseRKdTlUP5603TsI7isyHaT2zab/Z+GaQ6on29nhBgd7quCI0Z9qfMZFi9fan5HkbHlX1TiDnVLrjcWcatwu368Li2rR1g6LeEQ/x1X54DL0V50w69N1wLLA33oxx2N6zAmHjONr+PR0dCNVK+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldNaK3Gx9/fGINc8zhg3sbzLwLIV9FeqMKS3JlmTZxk=;
 b=UqtcuHG5tLurWQd0VBvxNZIMkYLHHdhQNsA/A4Ysjs+mJ6FsFfPH3e4j/53SKF7LElrEbFMCNW3gFbvSUgcLwHs1vodeIUaMltuVRrn81NJf3qbQx4pItZu3lxdPv2QMAH2BOkjDkXdDyjyKl+uIUiWekKdX+csAr+ZNEx1tTpXIAdZdTNNKiNxU2u0piTa/Tr+BdYjfRYGeGEvGBuXOYe1a66GXNHP3jlTxk5DGZL8iKX6rA64YyaU9C3aI6oLDmW8/Ze9W4VRIDX8bmvA2mdU0QB7TasLQe1hDDiIh7UaIOaOn2o8aj5BXrkrn2OYieH90J3uL1tWCGB/j7FMs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldNaK3Gx9/fGINc8zhg3sbzLwLIV9FeqMKS3JlmTZxk=;
 b=X+AltRyu+LrdtzOhOCXDZMfoSaCxtgLaG6fvnAnMp0Q2RNjNbskckEdbNp0e5MKJNKsmiWGWOTcVzR03e0E24XseqBckqYZe/gdNHIFkvKixc65uSp0/pH6YN+6zLTpEn0YHQMOX/48iZFqVNKPSIWiFcRRk5vtolnM+zy6Q42c=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2362.jpnprd01.prod.outlook.com (2603:1096:404:6d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 04:18:07 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3088.023; Fri, 12 Jun 2020
 04:18:07 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/3] mmc: tmio: core: Add end operation into
 tmio_mmc_dma_ops
Thread-Topic: [PATCH 1/3] mmc: tmio: core: Add end operation into
 tmio_mmc_dma_ops
Thread-Index: AQHWLz2iaxoqiyRm2kC1lPsZ0UdccqjUAGWAgAB8dcA=
Date:   Fri, 12 Jun 2020 04:18:07 +0000
Message-ID: <TY2PR01MB369262F0A7701E6C5BF3961FD8810@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1590044466-28372-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200611203235.GA10758@ninjato>
In-Reply-To: <20200611203235.GA10758@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2909887f-b4b9-4a32-bf13-08d80e879c10
x-ms-traffictypediagnostic: TY2PR01MB2362:
x-microsoft-antispam-prvs: <TY2PR01MB2362963ED06577E542F5434FD8810@TY2PR01MB2362.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:475;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ulkfgd3nkGsVmv+SDIVvKizEIisN/B/s1ji7co1d4dwKOIVLDKvvlOY/ryzjZzaMGXqzzxt46l7rOHYLpsjO+AaUlfydyOqzRgf6Z6RIYJ3baaNH5jeRJHOUwXj4zORK4jondNcDVGDPt82gkNNCSROqJ4Wt5rOgJJ1YMsVO4C0avXGh0NbSq1RTPM7b7Ou+npH1OOl48rb7j0rP0ISNxLWhU1WFp4fIw98GovhL73BFGsUZ7Bzu1lkjPXK2qvf98MBCMqbr9L9liZhJ18kxC7GPHVtvoStIjyR00ouX8LCwa0RKuTGzsUBeYpIz6EOXRGpj+4LE60YOo/4UY7BoMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(2906002)(9686003)(54906003)(30864003)(316002)(83380400001)(5660300002)(52536014)(71200400001)(76116006)(26005)(8676002)(55016002)(64756008)(478600001)(66556008)(66446008)(86362001)(66476007)(8936002)(66946007)(7696005)(6506007)(4326008)(186003)(55236004)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: HJjggYgosogWV+40YiSNPO2T1E5jxTPn9Ow2qnaIIXvnBMki3TUbI13ajhrDT+WWQZDvKBUbybS2O8x+w+i7XZIqCFnhfqaUhp8pnGdpIzeMMNAsAaiWuR9dJcFvfiVE95E1uER2/RxfqIOiO39VLewlf8YpcmYq56Tt3vbPvqkOT/9EuGnGRPurLVeJ23QveV9NnUPYPTFBWZnil3HILtrFCo+SmQDVBhtXeGdyzIWFaAlebrKd3bXp3jyJ2dlqxAKZ342KaRV2x5e3ko32YvgztucDJuDDEMNx0tnPkTnld0lRsriDs5AKp8ofWXriryiVo3n7YxCvEp+9WqT2U9z7AWUzbGQGOJEu3lfpnjO0CtP/qoubc1P4ep0qke6oaS7+1x881TVbBivZhE4mIx3yJy6sUcc58ik4UiEmiFmX449nyrx92WDuqt0cQYk5alIXSE2zv2rMh/ZIylbL7m29AYv6rjMQh8DWCcFYs9qNAD1ldI5A7Vt2ZTN836+o
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2909887f-b4b9-4a32-bf13-08d80e879c10
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 04:18:07.3143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3qLa0garAV4YcGD4UeoTLH0k95PyA7LwlaWfwFdOF94RPah8GmsFcxCeODjKJGiFtXHkzQGexrCAxSI/BtWmnndR1IJBNVOtbaXoHZ7FqFXWKOeeTjzoL8PfkvmfPG0v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2362
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, June 12, 2020 5:33 AM
>=20
> Hi,
>=20
> On Thu, May 21, 2020 at 04:01:04PM +0900, Yoshihiro Shimoda wrote:
<snip>
> > diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> > index b4cf101..0a4f365 100644
> > --- a/drivers/mmc/host/tmio_mmc.h
> > +++ b/drivers/mmc/host/tmio_mmc.h
> > @@ -118,6 +118,9 @@ struct tmio_mmc_dma_ops {
> >  	void (*release)(struct tmio_mmc_host *host);
> >  	void (*abort)(struct tmio_mmc_host *host);
> >  	void (*dataend)(struct tmio_mmc_host *host);
> > +
> > +	/* optional */
> > +	void (*end)(struct tmio_mmc_host *host);	/* held host->lock */
>=20
> Okay, the good news is that I can reproduce the error case. I also get a
> growing list in /sys/kernel/debug/dma-api/dump.

Good news!

> However, here, the list does not grow at the same rate as the fake
> timeouts are injected. So, it doesn't look like the unmapping is missed
> every time but only occasionally, so this seems like a race somewhere?
>=20
> And if that is true, I wonder if we couldn't fix the current error paths
> instead of adding another callback?
>=20
> Or do you get a missed unmap for every timeout, Shimoda-san?

No, I got.
So, I investigate why, and then it found the injected timeout happened on C=
MD13
didn't cause a missed unmap because the command didn't map any buffer (host=
->dma_on =3D=3D false).

JFYI, my debug patch and log messages are pasted below:

---
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesa=
s_sdhi_core.c
index 15e21894bd44..8c306597a105 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -664,6 +664,12 @@ static int renesas_sdhi_wait_idle(struct tmio_mmc_host=
 *host, u32 bit)
=20
 	if (!timeout) {
 		dev_warn(&host->pdev->dev, "timeout waiting for SD bus idle\n");
+		dev_warn(&host->pdev->dev,
+			 "debug=3D%d timeout=3D%d no_dma=3D%d real=3D%d both=3D%d map=3D%d unma=
p=3D%d\n",
+			 host->debug, host->debug_timeout,
+			 host->debug_timeout_no_dma,
+			 host->debug_real_timeout, host->debug_both_timeout,
+			 host->debug_map, host->debug_unmap);
 		return -EBUSY;
 	}
=20
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/ho=
st/renesas_sdhi_internal_dmac.c
index 47ac53e91241..af16ff3b0868 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -208,6 +208,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_ho=
st *host,
 					    sg_dma_address(sg));
=20
 	host->dma_on =3D true;
+	host->debug_map++;
=20
 	return;
=20
@@ -246,6 +247,7 @@ static void renesas_sdhi_internal_dmac_complete_tasklet=
_fn(unsigned long arg)
=20
 	renesas_sdhi_internal_dmac_enable_dma(host, false);
 	dma_unmap_sg(&host->pdev->dev, host->sg_ptr, host->sg_len, dir);
+	host->debug_unmap++;
=20
 	if (dir =3D=3D DMA_FROM_DEVICE)
 		clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index b4cf10109162..ee950e453a26 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -189,6 +189,13 @@ struct tmio_mmc_host {
 	void (*hs400_complete)(struct tmio_mmc_host *host);
=20
 	const struct tmio_mmc_dma_ops *dma_ops;
+	int debug;
+	int debug_timeout;
+	int debug_real_timeout;
+	int debug_both_timeout;
+	int debug_timeout_no_dma;
+	int debug_map;
+	int debug_unmap;
 };
=20
 struct tmio_mmc_host *tmio_mmc_host_alloc(struct platform_device *pdev,
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_c=
ore.c
index d7fde57c78c1..e5aebd44b0c7 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -546,8 +546,19 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *hos=
t, unsigned int stat)
 		cmd->resp[0] =3D cmd->resp[3];
 	}
=20
-	if (stat & TMIO_STAT_CMDTIMEOUT)
+	host->debug++;
+	if (stat & TMIO_STAT_CMDTIMEOUT || !(host->debug & 0xff)) {
 		cmd->error =3D -ETIMEDOUT;
+		if (stat & TMIO_STAT_CMDTIMEOUT)
+			host->debug_real_timeout++;
+		if (!(host->debug & 0xff)) {
+			host->debug_timeout++;
+			if (!host->dma_on)
+				host->debug_timeout_no_dma++;
+		}
+		if (stat & TMIO_STAT_CMDTIMEOUT && !(host->debug & 0xff))
+			host->debug_both_timeout++;
+	}
 	else if ((stat & TMIO_STAT_CRCFAIL && cmd->flags & MMC_RSP_CRC) ||
 		 stat & TMIO_STAT_STOPBIT_ERR ||
 		 stat & TMIO_STAT_CMD_IDX_ERR)
@@ -797,6 +808,8 @@ static void tmio_mmc_finish_request(struct tmio_mmc_hos=
t *host)
=20
 	spin_lock_irqsave(&host->lock, flags);
=20
+	host->dma_on =3D false;
+
 	mrq =3D host->mrq;
 	if (IS_ERR_OR_NULL(mrq)) {
 		spin_unlock_irqrestore(&host->lock, flags);
--=20
2.17.1
---

~ # dmesg | grep mmc
[    3.674229] renesas_sdhi_internal_dmac ee100000.sd: mmc0 base at 0x00000=
000ee100000, max clock rate 200 MHz
[    3.742939] renesas_sdhi_internal_dmac ee140000.sd: mmc1 base at 0x00000=
000ee140000, max clock rate 200 MHz
[    3.822470] renesas_sdhi_internal_dmac ee160000.sd: mmc2 base at 0x00000=
000ee160000, max clock rate 200 MHz
[    3.922265] mmc1: new HS400 MMC card at address 0001
[    3.927919] mmcblk1: mmc1:0001 BGSD3R 29.1 GiB=20
[    3.932705] mmcblk1boot0: mmc1:0001 BGSD3R partition 1 16.0 MiB
[    3.946713] mmcblk1boot1: mmc1:0001 BGSD3R partition 2 16.0 MiB
[    3.961567] mmcblk1rpmb: mmc1:0001 BGSD3R partition 3 4.00 MiB, chardev =
(243:0)
[    3.984810]  mmcblk1: p1
[    4.007834] mmc0: new ultra high speed SDR104 SDHC card at address aaaa
[    4.015030] mmcblk0: mmc0:aaaa SL32G 29.7 GiB=20
[    4.051127]  mmcblk0: p1
~ #=20
~ # cat /sys/kernel/debug/dma-api/dump | grep sd
~ #=20
~ # dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D8k count=3D1k &
~ # [   86.183589] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting =
for SD bus idle
[   86.191318] renesas_sdhi_internal_dmac ee100000.sd: debug=3D256 timeout=
=3D1 no_dma=3D0 real=3D6 both=3D0 map=3D111 unmap=3D110
[   86.202819] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   86.210483] renesas_sdhi_internal_dmac ee100000.sd: debug=3D256 timeout=
=3D1 no_dma=3D0 real=3D6 both=3D0 map=3D111 unmap=3D110
[   86.221984] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   86.229650] renesas_sdhi_internal_dmac ee100000.sd: debug=3D256 timeout=
=3D1 no_dma=3D0 real=3D6 both=3D0 map=3D111 unmap=3D110
[   86.241237] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   86.248999] renesas_sdhi_internal_dmac ee100000.sd: debug=3D256 timeout=
=3D1 no_dma=3D0 real=3D6 both=3D0 map=3D111 unmap=3D110
[   86.260589] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   86.268274] renesas_sdhi_internal_dmac ee100000.sd: debug=3D256 timeout=
=3D1 no_dma=3D0 real=3D6 both=3D0 map=3D111 unmap=3D110
[   91.356599] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
[   91.482031] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   91.489717] renesas_sdhi_internal_dmac ee100000.sd: debug=3D768 timeout=
=3D3 no_dma=3D1 real=3D6 both=3D0 map=3D365 unmap=3D363
[   91.501336] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   91.509055] renesas_sdhi_internal_dmac ee100000.sd: debug=3D768 timeout=
=3D3 no_dma=3D1 real=3D6 both=3D0 map=3D365 unmap=3D363
[   91.520577] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   91.528313] renesas_sdhi_internal_dmac ee100000.sd: debug=3D768 timeout=
=3D3 no_dma=3D1 real=3D6 both=3D0 map=3D365 unmap=3D363
[   91.539817] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   91.547483] renesas_sdhi_internal_dmac ee100000.sd: debug=3D768 timeout=
=3D3 no_dma=3D1 real=3D6 both=3D0 map=3D365 unmap=3D363
[   91.559009] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   91.566686] renesas_sdhi_internal_dmac ee100000.sd: debug=3D768 timeout=
=3D3 no_dma=3D1 real=3D6 both=3D0 map=3D365 unmap=3D363
[   96.732560] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
[   96.803665] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   96.811419] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1024 timeout=
=3D4 no_dma=3D1 real=3D12 both=3D0 map=3D489 unmap=3D486
[   96.823096] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   96.830760] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1024 timeout=
=3D4 no_dma=3D1 real=3D12 both=3D0 map=3D489 unmap=3D486
[   96.842434] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   96.850097] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1024 timeout=
=3D4 no_dma=3D1 real=3D12 both=3D0 map=3D489 unmap=3D486
[   96.861787] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   96.869488] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1024 timeout=
=3D4 no_dma=3D1 real=3D12 both=3D0 map=3D489 unmap=3D486
[   96.881278] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[   96.888971] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1024 timeout=
=3D4 no_dma=3D1 real=3D12 both=3D0 map=3D489 unmap=3D486
[  102.108592] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
[  102.207529] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  102.215309] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1536 timeout=
=3D6 no_dma=3D2 real=3D12 both=3D0 map=3D744 unmap=3D740
[  102.226986] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  102.234652] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1536 timeout=
=3D6 no_dma=3D2 real=3D12 both=3D0 map=3D744 unmap=3D740
[  102.246325] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  102.254052] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1536 timeout=
=3D6 no_dma=3D2 real=3D12 both=3D0 map=3D744 unmap=3D740
[  102.265841] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  102.273508] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1536 timeout=
=3D6 no_dma=3D2 real=3D12 both=3D0 map=3D744 unmap=3D740
[  102.285259] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  102.292944] renesas_sdhi_internal_dmac ee100000.sd: debug=3D1536 timeout=
=3D6 no_dma=3D2 real=3D12 both=3D0 map=3D744 unmap=3D740
--> This means:
 - injected timeout happened 6 times
 -- in this case, dma_on =3D false was observed 2 times.
 ---> So, leaking unmap happened 4 times.
 - The numbers of "map" and "unmap" also indicated that leaking unmap happe=
ned 4 times.

[  107.484619] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)

1024+0 records in
1024+0 records out
8388608 bytes (8.0MB) copied, 21.460091 seconds, 381.7KB/s

[1]+  Done                       dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D8=
k count=3D1k
~ #=20
~ #=20
~ # cat /sys/kernel/debug/dma-api/dump | grep sd | wc
        4        64       612
--> DMA_API_DEBUG debugfs also had "4"

~ #=20
~ #=20
~ #=20
~ # dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D8k count=3D1k &
~ # [  120.528606] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting =
for SD bus idle
[  120.536283] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2048 timeout=
=3D8 no_dma=3D3 real=3D12 both=3D0 map=3D999 unmap=3D994
[  120.547958] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  120.555621] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2048 timeout=
=3D8 no_dma=3D3 real=3D12 both=3D0 map=3D999 unmap=3D994
[  120.567294] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  120.574957] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2048 timeout=
=3D8 no_dma=3D3 real=3D12 both=3D0 map=3D999 unmap=3D994
[  120.586702] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  120.594375] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2048 timeout=
=3D8 no_dma=3D3 real=3D12 both=3D0 map=3D999 unmap=3D994
[  120.606101] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  120.613774] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2048 timeout=
=3D8 no_dma=3D3 real=3D12 both=3D0 map=3D999 unmap=3D994
[  125.660558] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
[  125.743798] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  125.751549] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2304 timeout=
=3D9 no_dma=3D3 real=3D18 both=3D0 map=3D1123 unmap=3D1117
[  125.763400] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  125.771067] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2304 timeout=
=3D9 no_dma=3D3 real=3D18 both=3D0 map=3D1123 unmap=3D1117
[  125.782985] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  125.790658] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2304 timeout=
=3D9 no_dma=3D3 real=3D18 both=3D0 map=3D1123 unmap=3D1117
[  125.802610] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  125.810278] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2304 timeout=
=3D9 no_dma=3D3 real=3D18 both=3D0 map=3D1123 unmap=3D1117
[  125.822148] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  125.829825] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2304 timeout=
=3D9 no_dma=3D3 real=3D18 both=3D0 map=3D1123 unmap=3D1117
[  131.036560] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
[  131.176918] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  131.184601] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2816 timeout=
=3D11 no_dma=3D4 real=3D18 both=3D0 map=3D1377 unmap=3D1370
[  131.196557] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  131.204385] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2816 timeout=
=3D11 no_dma=3D4 real=3D18 both=3D0 map=3D1377 unmap=3D1370
[  131.216491] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  131.224161] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2816 timeout=
=3D11 no_dma=3D4 real=3D18 both=3D0 map=3D1377 unmap=3D1370
[  131.236096] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  131.243763] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2816 timeout=
=3D11 no_dma=3D4 real=3D18 both=3D0 map=3D1377 unmap=3D1370
[  131.255738] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  131.263446] renesas_sdhi_internal_dmac ee100000.sd: debug=3D2816 timeout=
=3D11 no_dma=3D4 real=3D18 both=3D0 map=3D1377 unmap=3D1370
--> 7 times

[  136.412594] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
1024+0 records in
1024+0 records out
8388608 bytes (8.0MB) copied, 15.988695 seconds, 512.4KB/s

[1]+  Done                       dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D8=
k count=3D1k
~ #=20
~ #=20
~ # cat /sys/kernel/debug/dma-api/dump | grep sd | wc =1B[K
        7       112      1072
--> 7 times

~ # dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D8k count=3D1k &
~ # [  153.454690] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting =
for SD bus idle
[  153.462430] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3328 timeout=
=3D13 no_dma=3D5 real=3D18 both=3D0 map=3D1632 unmap=3D1624
[  153.474369] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  153.482037] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3328 timeout=
=3D13 no_dma=3D5 real=3D18 both=3D0 map=3D1632 unmap=3D1624
[  153.493970] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  153.501635] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3328 timeout=
=3D13 no_dma=3D5 real=3D18 both=3D0 map=3D1632 unmap=3D1624
[  153.513586] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  153.521403] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3328 timeout=
=3D13 no_dma=3D5 real=3D18 both=3D0 map=3D1632 unmap=3D1624
[  153.533388] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  153.541056] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3328 timeout=
=3D13 no_dma=3D5 real=3D18 both=3D0 map=3D1632 unmap=3D1624
[  158.684563] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
[  158.773970] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  158.781827] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3584 timeout=
=3D14 no_dma=3D5 real=3D24 both=3D0 map=3D1756 unmap=3D1747
[  158.793798] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  158.801524] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3584 timeout=
=3D14 no_dma=3D5 real=3D24 both=3D0 map=3D1756 unmap=3D1747
[  158.813478] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  158.821146] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3584 timeout=
=3D14 no_dma=3D5 real=3D24 both=3D0 map=3D1756 unmap=3D1747
[  158.833090] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  158.840824] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3584 timeout=
=3D14 no_dma=3D5 real=3D24 both=3D0 map=3D1756 unmap=3D1747
[  158.852816] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  158.860488] renesas_sdhi_internal_dmac ee100000.sd: debug=3D3584 timeout=
=3D14 no_dma=3D5 real=3D24 both=3D0 map=3D1756 unmap=3D1747
[  164.060563] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
[  164.154898] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  164.162672] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4096 timeout=
=3D16 no_dma=3D6 real=3D24 both=3D0 map=3D2010 unmap=3D2000
[  164.174607] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  164.182272] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4096 timeout=
=3D16 no_dma=3D6 real=3D24 both=3D0 map=3D2010 unmap=3D2000
[  164.194273] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  164.201950] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4096 timeout=
=3D16 no_dma=3D6 real=3D24 both=3D0 map=3D2010 unmap=3D2000
[  164.213979] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  164.221648] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4096 timeout=
=3D16 no_dma=3D6 real=3D24 both=3D0 map=3D2010 unmap=3D2000
[  164.233625] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  164.241295] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4096 timeout=
=3D16 no_dma=3D6 real=3D24 both=3D0 map=3D2010 unmap=3D2000
[  169.436561] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
[  169.502256] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  169.510040] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4352 timeout=
=3D17 no_dma=3D6 real=3D30 both=3D0 map=3D2134 unmap=3D2123
[  169.521978] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  169.529645] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4352 timeout=
=3D17 no_dma=3D6 real=3D30 both=3D0 map=3D2134 unmap=3D2123
[  169.541597] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  169.549352] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4352 timeout=
=3D17 no_dma=3D6 real=3D30 both=3D0 map=3D2134 unmap=3D2123
[  169.561374] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  169.569137] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4352 timeout=
=3D17 no_dma=3D6 real=3D30 both=3D0 map=3D2134 unmap=3D2123
[  169.581142] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
SD bus idle
[  169.588833] renesas_sdhi_internal_dmac ee100000.sd: debug=3D4352 timeout=
=3D17 no_dma=3D6 real=3D30 both=3D0 map=3D2134 unmap=3D2123
--> 11 times

[  174.812597] renesas_sdhi_internal_dmac ee100000.sd: timeout waiting for =
hardware interrupt (CMD13)
1024+0 records in
1024+0 records out
8388608 bytes (8.0MB) copied, 21.521918 seconds, 380.6KB/s

[1]+  Done                       dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D8=
k count=3D1k
~ #=20
~ # cat /sys/kernel/debug/dma-api/dump | grep sd | wc
       11       176      1688
--> 11 times

Best regards,
Yoshihiro Shimoda

