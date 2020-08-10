Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2511240B5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 18:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgHJQt4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 12:49:56 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:49760
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726942AbgHJQt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 12:49:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nviNp9nY8X0VQBGxSFFLPDxONA1t+cHHSm1BQc0OdCtA9IudKnReko8pbW1SzNTYVw7Z4MbSfkH0gBAvTcyfmXXQqpOQD8LARQhPd2+85dXL8COW6ENEdxGqe59WPbfGrFyOfgWgXKeugtFwZQSMDKvy894GsBM/F9V1QmXDiCTzO+QwFsFkGw/EusM+U0qjYeVyIpaVewF89yzqER+J+fUCswaveyneRr7wMf9OEjo0A0bLZRwtuyWjafVgI6ZWWfqn/2+aZ66tzHmT/yKPunIJ1XAJjh5weqqdlGWWKrZDObCWHvTN6oM2rG9VtjiEtnCd5RxhtfxfdWbfQopjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvVbWXw9plxDSSP2AabnReitHuwCz47hLCdapWLejdY=;
 b=RgMtSA+aquOOR/0pJKoFeZdqUMnKGtagW6+tN3vMivN0b3MH/h33hE98SQAAvngFF0keuy+llefH86hr/E1k3F2As1SLv3YnDJ39M+rkcQANvgELH1buK4vjrW9S8SEes5kWPOVUtVoy6cyXtP1ENQfXJ4S7QMKSEiMu+CCWUI4A7QQaEqcGRtlz8UwPLlQI7zWjbskAaPu+jb5cw+X4VpGyRoY1tgQknpsW7WiEg3DRZ61cidKFeQy41Z474SRE7QEnojrewt09v1xwLU7uYBdPAtHlAFlvUiF/pHrf5BFzkIYs5vM6hQcWCHOAtxfNnijHq2WkTWBxZ3WMNukvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvVbWXw9plxDSSP2AabnReitHuwCz47hLCdapWLejdY=;
 b=MLyw524vjFmC24lb7X81lxMCCPatF5IQTnjz9y9oN3DsizFJMB+AQs/11P2pQSbOGhEBC/DEC91AUTWz66efKhYoqzbJAB83aylMo4pmHmPKl/6wZfbggCFgMDQ62xYrLfiWT5L5FtudWxs3RpWt/sX+UxvDpLLQTkysHTHiaFA=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSAPR01MB2098.jpnprd01.prod.outlook.com (2603:1096:603:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Mon, 10 Aug
 2020 16:49:50 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::3c9a:53d7:17c4:4ce9]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::3c9a:53d7:17c4:4ce9%3]) with mapi id 15.20.3261.025; Mon, 10 Aug 2020
 16:49:50 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ata: sata_rcar: Fix DMA boundary mask
Thread-Topic: RE: [PATCH] ata: sata_rcar: Fix DMA boundary mask
Thread-Index: AdZvNQA3VsJu6Uz4RN+G1lZzO7isEA==
Date:   Mon, 10 Aug 2020 16:49:50 +0000
Message-ID: <OSBPR01MB5048FE40232F201D49C18887AA440@OSBPR01MB5048.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 52098fa1-ad0e-4689-9bee-08d83d4d6601
x-ms-traffictypediagnostic: OSAPR01MB2098:
x-microsoft-antispam-prvs: <OSAPR01MB2098BF4BA10E7AF96568AA48AA440@OSAPR01MB2098.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BcOzRFLOEYL++qG0uaUgKknEjPrSjhXz6ySm8VG44MCGboMcW3KIua0rpglbIbuAPoNGZKm11W3x4D29POGPrCI+IVmYSL6r6MsavVJM8obXXfWSnugN01HITUqsUvnUDfqEUZ2MotWYMIJnwMS+ChCY1mmm02gD2SYvlOlvzMhT1rM3wc/C5ZzgGMW6B+R9ez7Bmdo2Z1hQ+K29mque98rQpLcTYRsTWsGtbIh/BfM+j9HldrC9+4IB2XuAtyy3y2urQxy6OSrCumYYkfIUuKeGe7qB12VVqmP2uuXQ9nrUqgpn9JtXEYoE/rhO5HUu1hD7Pn2LM/1/LKNvbmIdlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(2906002)(186003)(83380400001)(52536014)(4326008)(86362001)(26005)(5660300002)(66476007)(66946007)(66446008)(7696005)(53546011)(6506007)(8936002)(64756008)(66556008)(33656002)(478600001)(316002)(8676002)(76116006)(54906003)(55016002)(7416002)(9686003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 84ZbaLn/z6zP3zBGwZOYwyup6KROjX9IWAmcONRXW64ssXBLwztmPJpQmhf+p2ioUU2oskgqgO6tRrEnEvICLhI7gyd1wwgmOuB/Evb3e48ewZgbYou9MgY7MnjzyWI56PHqjHtYQTrc0YQvo9W8YnAdn6tS2SsQlL1MZKIOZP58O+LJho0YMVvxR4EaZXrDnkopbFShNoMc/lF3/0T/qyrDxXl/V3E71X4WXsJvHUKWCj40+JNR76TrjZCuuMvrPt/M2+G9VoSXFNbXd+3XukuOOjleyz5ZaNWx7tj8LO5BLuJk9FKC2oit4nr4MOayL/WxsXPBCGTjgVoNgswPevtzb1hm5zAiMYA1T120sK2t5HrvTNyWjG+wqxZZvaWhqwy4MWgSoC8Ncw653mRmUR9kX1kESdR4DVsWQ5oBvgY+3fwqg/dE19fVcqQLFu3X0z9Sqw0qmFNZSuOVcKmzMpcgQR6ycr2/dtjv2qaXVSqIYHzfFksXQNlSshGlxAvw4uqsG1pcv4fYRs9qxzyytBaN4KbLB2NHHnuY4Dat9X/TW8vdFa0PwOdx7wUz+7UpsAOlLwh15i7ZcfkUsSwtuzFmFmm5HLMXTQhg7+FLW1BkiDq6ZyV7jP3gR6J5sbdWdaN8FJ0ZFt1ialtiGspsjA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52098fa1-ad0e-4689-9bee-08d83d4d6601
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 16:49:50.4793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yhKP1l8m39/klOhzqeOhLqKKGFRBMxekeqiEWG7C+5Z9RVZmrgVcSwdRoUqzpMQCj+cjE40bKO0Qn9999llDR0y3zfR1c7sEnF+wV0l28WlabYapGmsbQEECKcsCTwv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2098
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

> -----Original Message-----
> From: linux-ide-owner@vger.kernel.org <linux-ide-owner@vger.kernel.org> O=
n Behalf Of Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 13 May 2020 12:04
> To: Jens Axboe <axboe@kernel.dk>; Ulf Hansson <ulf.hansson@linaro.org>; G=
reg Kroah-Hartman <gregkh@linuxfoundation.org>;
> Christoph Hellwig <hch@lst.de>
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>; linux-ide@vger.=
kernel.org; linux-renesas-soc@vger.kernel.org; linux-
> scsi@vger.kernel.org; linux-kernel@vger.kernel.org; Geert Uytterhoeven <g=
eert+renesas@glider.be>
> Subject: [PATCH] ata: sata_rcar: Fix DMA boundary mask
>
> Before commit 9495b7e92f716ab2 ("driver core: platform: Initialize
> dma_parms for platform devices"), the R-Car SATA device didn't have DMA
> parameters.  Hence the DMA boundary mask supplied by its driver was
> silently ignored, as __scsi_init_queue() doesn't check the return value
> of dma_set_seg_boundary(), and the default value of 0xffffffff was used.
>
> Now the device has gained DMA parameters, the driver-supplied value is
> used, and the following warning is printed on Salvator-XS:
>
>     DMA-API: sata_rcar ee300000.sata: mapping sg segment across boundary =
[start=3D0x00000000ffffe000] [end=3D0x00000000ffffefff]
> [boundary=3D0x000000001ffffffe]
>     WARNING: CPU: 5 PID: 38 at kernel/dma/debug.c:1233 debug_dma_map_sg+0=
x298/0x300
>
> (the range of start/end values depend on whether IOMMU support is
>  enabled or not)
>
> The issue here is that SATA_RCAR_DMA_BOUNDARY doesn't have bit 0 set, so
> any typical end value, which is odd, will trigger the check.
>
> Fix this by increasing the DMA boundary value by 1.
>
> Fixes: 8bfbeed58665dbbf ("sata_rcar: correct 'sata_rcar_sht'")
> Fixes: 9495b7e92f716ab2 ("driver core: platform: Initialize dma_parms for=
 platform devices")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> As by default the DMA debug code prints the first error only, this issue
> may be hidden on plain v5.7-rc5, where the FCP driver triggers a similar
> warning.  Merging commit dd844fb8e50b12e6 ("media: platform: fcp: Set
> appropriate DMA parameters") from the media tree fixes the FCP issue,
> and exposes the SATA issue.
>
> I added the second fixes tag because that commit is already being
> backported to stable kernels, and this patch thus needs backporting,
> too.
> ---
>  drivers/ata/sata_rcar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Without this patch I see SATA link being reset while doing a dd (dd if=3D/d=
ev/urandom of=3Drandom-data bs=3D1M count=3D1000)

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
> index 980aacdbcf3b42b9..752db75b611e8f8a 100644
> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -120,7 +120,7 @@
>  /* Descriptor table word 0 bit (when DTA32M =3D 1) */
>  #define SATA_RCAR_DTENDBIT(0)
>
> -#define SATA_RCAR_DMA_BOUNDARY0x1FFFFFFEUL
> +#define SATA_RCAR_DMA_BOUNDARY0x1FFFFFFFUL
>
>  /* Gen2 Physical Layer Control Registers */
>  #define RCAR_GEN2_PHY_CTL1_REG0x1704
> --
> 2.17.1
>



Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
