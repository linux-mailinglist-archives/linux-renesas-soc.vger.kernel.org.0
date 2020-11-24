Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD0C2C25DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 13:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387619AbgKXMlr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 07:41:47 -0500
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:6076
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733091AbgKXMlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 07:41:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHqK7n2PWof0+Ww5Y48tVoE6hj6qUm3qG8w6dHkRwmmg5cbyOZEJQoQqAOHzeuQGk6NMpokANlXxqQnMcE7hXVP2YLbKu8RzllRjj5hTsRIKJ/VZm4OH2rdL8ZYPn8ZiybWfKuMYJj9ZdZL+5LjvpQsrZusJCHEgTdhWrhc9joKmDkatceNpzagnJxagCjojmDnmUilFrm1Z9RUpkNe7rYe0gtcQhFYXOsvsHYDBrE2pGtGhYQ+K8O90mlyLmrs2NqGo+OsAPLA9SojeoT0msL3rpUReyFRahh4lRpfqdUYGgFdRMP9CrORAbYIrQmR+8COOEBOhgNUz0JHi8OF5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRQgcFXeyvuwXrtveYy+Rtl0eYp1CZjTvYQVzha/zN8=;
 b=AHamMCXRhECO+ZxIAxiDekt4VqRcDm8GJBuCr6ofKQMcc1iNGncDMuOf0fBjpaMm/KdLTCxeV+Ne1w7ffjtaj4Armwx/1+iXp9HsLdULQeDd51V73hlbaDYnfJwQvhG256RmTsvew96gOFbgujciX4ZLSAWXlu5649uCOmpS0AD3MuO+HfmvoqlRUIr1SAj8YT9seXO1xpzOFjU49kf4yKgjmi1L+NG3+y2tP7sn+WtrHLDzznB3OtM+6DiiZISyTbsj+kSKjQKZTmRuFpYXNAyXYz2ENOrcSbWnTBtND7jguS9lh3A9+uBgMFPjxp1lngDyDDf1LcyB5S5BG2pIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRQgcFXeyvuwXrtveYy+Rtl0eYp1CZjTvYQVzha/zN8=;
 b=TIbG5a1NeyVHOJicToWJGkuPKUgIVyeCl67VXjpLENKxLI8ZaIkDQns70ugIozWFa9+46JQxvdcO138yu4ai8b7MBohArFdpvFSRz5LLFwpan1fTHoe/N76REgYfSo9v7PpWMMNTw1flP2bS9eKpJp7f5I9UlGiZWRd6u2HgTZg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5500.jpnprd01.prod.outlook.com (2603:1096:404:8037::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 12:41:41 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::59ed:a6ce:d8dc:90dd]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::59ed:a6ce:d8dc:90dd%6]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 12:41:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [PATCH RFT v2 2/3] mmc: tmio: Add data timeout error detection
Thread-Topic: [PATCH RFT v2 2/3] mmc: tmio: Add data timeout error detection
Thread-Index: AQHWv07MDdJVcaSnFkOo6ZOWAaI4B6nWv+Mg
Date:   Tue, 24 Nov 2020 12:41:41 +0000
Message-ID: <TY2PR01MB3692D348DCAA67B40C589C50D8FB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201120150647.123237-1-wsa+renesas@sang-engineering.com>
 <20201120150647.123237-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201120150647.123237-3-wsa+renesas@sang-engineering.com>
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
x-ms-office365-filtering-correlation-id: eb89410e-bff1-4945-01d5-08d890764b71
x-ms-traffictypediagnostic: TYAPR01MB5500:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB550074CA5D080765241DD744D8FB0@TYAPR01MB5500.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7yZBvA2HDY/YG7jb4hkAxb9nAOeTF8pBS905dOUfAt/pqxzxfm3X42y1BNGnhREXgrqlimysJNMsubBBWbbzORHkNeyyT87/hvzw+eLT2jP2v4TwpxGCvV2W+w9zNUkFfpexMgGSKDqd+bj34qRPdl9Jv3huX46a2QbQ/eDO2xLtKkylZFxzDxvayB6OXiAFpr8fQwSTuOJJ6C7bhagV0UiRZTQFZMFfplDmZB8CTdShZkpntbdeCiHRAMKdfEZhtjtegTLFJm+FmVllV9wC/OOM7R7+PuNVw1spNEi8zv6TC0MwdhykB0lycrzdjulENq1cLXu/bKeWEztJUyT5XiD0Xvu/bv/Qnu7yPsz4cwbBS/Tmt+zyOLMpTsGdBilC2whYrCLstZ1L/thTn7/ZFQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(66476007)(9686003)(2906002)(71200400001)(55236004)(26005)(478600001)(316002)(6506007)(7696005)(33656002)(966005)(54906003)(107886003)(8936002)(110136005)(186003)(55016002)(4326008)(8676002)(66946007)(86362001)(66446008)(76116006)(66556008)(64756008)(52536014)(83380400001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 1EmmtKgGG1n0gsgIeyXZgJtKg04mJFqD8T7hCEZDN6i53/kFmNEpFkHCbPzD0WOX8oLZGMLt0fHEfVvQ//bauqd8WApgzDgoS5bdHdD9gDNuBPpfbpHCNEtF/YzipxvEQBqaMSc4e+IeLjoHfQ5xJSbZM5u+JKXRHhKvjtt9EQwMHLGBI1vukulKGy3IkCfp22+26CbHH16eplZvLcLTNVyhpYdBC+LmaLROvebt3nKykHq/r01qqmW2OUYpQnybP1xMmy9BwGdMJ4bxuQXtoz7czCSgbFE3Z2/pYSNKpGdiOJDL7aqrCN69YYzdzGemBQmmnCK2nUtDQWtWjOoYRpu9UJe5pbiDIzLKk9Rz5M8aZSnppQBMCWXk1Qp7LoT5Th8w8BR0q0QF7mALiqiX4jxksn2n/FBebVQYGBacZrtgiuVSTZ194YGV+7PZtJsHaGEhblaj1An4ybthqE3HaJ2qM8c2LgDbKRdnGOtF3JQbIKwIzHNNJT3kcctQJP58hm4kxnPW8J13SoPl/y/kI0/TGFUvlweIn/h18OCYxu101PLEo+HLoQQMEmkJ14bhNGNEBhhWa8/PTtvHl2AfcokCxksAXcQFRPXkBeujZX8s8d5y3uDyIKaSgOS/ag+qE42rvkPV9E6gr2FhjfQZFUXqIcXtY2xGx+evJXKGtaFWVd3wCd10QeYG2C86PARf9VXE9zApmng1n16wPnMWsuG72rMEXvQhBZM34u0sgKTohHHLXriGXY5YLSDWCiN8TtzQLelAk1yKziGGxd5oz58kHhNU/1R+a2sOf24DIjG0+abHxe+1LUB4N3zsO4ORuovfvRaIU412U+ljvp5hszMfTP07twDj1MHGE11BYXbEIQboaemkJOQvc6Ntgf3+GcgZkQSfmNbIJ5IOL99jJQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb89410e-bff1-4945-01d5-08d890764b71
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 12:41:41.8593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpEtp2EgsVXg1fYJykbnjQLMTuidXbCVrWhccOHO8573Xz1xqLvTdStOZ3TnD16P6/Kos258OlcEOsyyYm8SPzoYkZNsmTm5AvmhpGPMpCNVWHzsI/w5BCMeFuv1MMfb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5500
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Saturday, November 21, 2020 12:07 AM
>=20
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> Currently, busy timeout is not checked for data transfer command. But,
> if the temperature condition changes, the data cannot be acquired
> correctly and timeout may occur. Also, we could reproduce an issue by
> using mmc_test driver (e.g. "Correct xfer_size at write (start
> failure)"). Therefore, this adds timeout error check.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [saito: rework commit message.]
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [shimoda: rebase, add commit description]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/host/tmio_mmc.h      |  6 ++++--
>  drivers/mmc/host/tmio_mmc_core.c | 17 +++++++++++------
>  2 files changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index 819198af17f4..15cf850e75d3 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -100,8 +100,10 @@
>  /* This is the mask used at reset by the chip */
>  #define TMIO_MASK_INIT_RCAR2	0x8b7f031d /* Initial value for R-Car Gen2+=
 */
>  #define TMIO_MASK_ALL           0x837f031d
> -#define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND)
> -#define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND)
> +#define TMIO_MASK_READOP  (TMIO_STAT_RXRDY | TMIO_STAT_DATAEND | \
> +			   TMIO_STAT_DATATIMEOUT)
> +#define TMIO_MASK_WRITEOP (TMIO_STAT_TXRQ | TMIO_STAT_DATAEND | \
> +			   TMIO_STAT_DATATIMEOUT)

I talked Saito-san about this patch locally and we can drop these lines
because this driver can detect data timeout in Access End interrupt
and the driver didn't enable error related interrupts like CRCFAIL.

>  #define TMIO_MASK_CMD     (TMIO_STAT_CMDRESPEND | TMIO_STAT_CMDTIMEOUT |=
 \
>  		TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT)
>  #define TMIO_MASK_IRQ     (TMIO_MASK_READOP | TMIO_MASK_WRITEOP | TMIO_M=
ASK_CMD)
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 4727fcfdf95f..541a0cf4a9fa 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -477,8 +477,10 @@ static void tmio_mmc_data_irq(struct tmio_mmc_host *=
host, unsigned int stat)
>  	if (!data)
>  		goto out;
>=20
> -	if (stat & TMIO_STAT_CRCFAIL || stat & TMIO_STAT_STOPBIT_ERR ||
> -	    stat & TMIO_STAT_TXUNDERRUN)
> +	if (stat & TMIO_STAT_DATATIMEOUT)
> +		data->error =3D -ETIMEDOUT;

The following commit [1] is a BSP local patch though,
we need to set -EILSEQ to retune a card for R-Car Gen3 [2]
by MMC core driver [3].

[1]
https://github.com/renesas-rcar/linux-bsp/commit/6f7519552fbed1474561ff423a=
cb967eb03994e3
Remarks (please look the [2] below at first):
 - The patch checks whether a card is removed or not by using MMC_CAP_NONRE=
MOVABLE and
   get_cd() to avoid retuning by MMC core driver for R-Car Gen3.
 - The patch also change the tmio_mmc_cmd_irq() when CMDTIMEOUT happens for=
 R-Car Gen3.
   But, for upstream, we should make a separated patch for it.
 - These "for R-Car Gen3" means I'm thinking we need additional condition:
    1) to set -EILSRQ or -ETIMEDOUT for R-Car Gen3
    2) to set -ETIMEDOUT anyway for other SoCs.
   # These are complex conditions a little though...

[2]
This is related to R-Car Gen3 tuning flow (e.g. Figure 70.32).

[3]
---
drivers/mmc/core/core.c:
void mmc_request_done(struct mmc_host *host, struct mmc_request *mrq)
{
        struct mmc_command *cmd =3D mrq->cmd;
        int err =3D cmd->error;

        /* Flag re-tuning needed on CRC errors */
        if (cmd->opcode !=3D MMC_SEND_TUNING_BLOCK &&
            cmd->opcode !=3D MMC_SEND_TUNING_BLOCK_HS200 &&
            !host->retune_crc_disable &&
            (err =3D=3D -EILSEQ || (mrq->sbc && mrq->sbc->error =3D=3D -EIL=
SEQ) ||
            (mrq->data && mrq->data->error =3D=3D -EILSEQ) ||              =
<-- here
            (mrq->stop && mrq->stop->error =3D=3D -EILSEQ)))
                mmc_retune_needed(host);
---

> +	else if (stat & TMIO_STAT_CRCFAIL || stat & TMIO_STAT_STOPBIT_ERR ||
> +		 stat & TMIO_STAT_TXUNDERRUN)
>  		data->error =3D -EILSEQ;
>  	if (host->dma_on && (data->flags & MMC_DATA_WRITE)) {
>  		u32 status =3D sd_ctrl_read16_and_16_as_32(host, CTL_STATUS);
> @@ -501,11 +503,13 @@ static void tmio_mmc_data_irq(struct tmio_mmc_host =
*host, unsigned int stat)
>  		}
>=20
>  		if (done) {
> -			tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_DATAEND);
> +			tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_DATAEND |
> +						  TMIO_STAT_DATATIMEOUT);
>  			tmio_mmc_dataend_dma(host);
>  		}
>  	} else if (host->dma_on && (data->flags & MMC_DATA_READ)) {
> -		tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_DATAEND);
> +		tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_DATAEND |
> +					  TMIO_STAT_DATATIMEOUT);
>  		tmio_mmc_dataend_dma(host);
>  	} else {
>  		tmio_mmc_do_data_irq(host);
> @@ -619,8 +623,9 @@ static bool __tmio_mmc_sdcard_irq(struct tmio_mmc_hos=
t *host, int ireg,
>  	}
>=20
>  	/* Data transfer completion */
> -	if (ireg & TMIO_STAT_DATAEND) {
> -		tmio_mmc_ack_mmc_irqs(host, TMIO_STAT_DATAEND);
> +	if (ireg & (TMIO_STAT_DATAEND | TMIO_STAT_DATATIMEOUT)) {
> +		tmio_mmc_ack_mmc_irqs(host, TMIO_STAT_DATAEND |
> +				      TMIO_STAT_DATATIMEOUT);

So, we can also drop these adding "TMIO_STAT_DATATIMEOUT".

Best regards,
Yoshihiro Shimoda

