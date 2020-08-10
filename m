Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F3B240B63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 18:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgHJQw5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 12:52:57 -0400
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:63840
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726720AbgHJQw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 12:52:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjC8SSiHMYuoLUYY6h5RSuzDmL0CG2/gW2SKGfj8DGnfPotzoGR4imD3QXcR05mp4TQm5K1OLWMPVv/6xqC4vJY4lEmtBM/IZvKW1LBa0UA4WwNsITcewRylpcfBskH8vur0xYu9aUjoUs/mDc9Zh5drI6BBqUwgGQxaUlDgq7QORCiv5Kn4bvRaw/jGKLSGv6MkHbz9OULRPfUzFo0rQEKF+QO992If7b3qgBJBE7lCRTIksb6QSIFqqiqEGSNYhEM5WAcL06A1RmbRF3DTT/QwDE8T5G7Svp5uxxjhoDSE91s0n1Y8tuUM5lGG5gk+9xbOBmjcWY3SNnEX3vZL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvVbWXw9plxDSSP2AabnReitHuwCz47hLCdapWLejdY=;
 b=oFa28jJhsPrbl7T5WPb4mrEBpDOixr8HX5vsCwzUMUQb6KdNn2dmqJeWEmq6F0d/PNEab+GQa8lOAnffmshnUIUIOB9xRb1rSwEE7UJTykEeY1T1TLCw/cfG0vORmX8PEcIxjqX9H4Q0x63Yjqzsmu9XzI2Hk5zev0yiykHZElpAmOEle4zWVrS3r4pKE49Xay1Xj3voKaYMKHlgQ6b5k61f01zLwItyEto5d5Ky49ta+dy8cl/WU7zjfjcDAWDTjjFcQtORZJPBcPUiafrcVyMoikwyo6Qdtu2VMgps+IIErZLRa9/yH2LzdbCVTq+tp+tMLIa1B+UZxoUBPDC5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvVbWXw9plxDSSP2AabnReitHuwCz47hLCdapWLejdY=;
 b=KT+6HWuPS1mgL3xRMd8Mj6kF5zsWQRQryo/3JG2wvxQjmU0HEcbWuD9/QF0OFPG0RCJaAvnl0eoVrJjQtBZj+8lxOXCHWwgbtDEki66vUusfpkI9pF3CrzROByJ5xjpllKJSwLUnd8nEFLEsY5FhEd/EqGkLNi1gjVZ1Ew5DRaU=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSAPR01MB2098.jpnprd01.prod.outlook.com (2603:1096:603:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Mon, 10 Aug
 2020 16:52:52 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::3c9a:53d7:17c4:4ce9]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::3c9a:53d7:17c4:4ce9%3]) with mapi id 15.20.3261.025; Mon, 10 Aug 2020
 16:52:52 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>
CC:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ata: sata_rcar: Fix DMA boundary mask
Thread-Topic: [PATCH] ata: sata_rcar: Fix DMA boundary mask
Thread-Index: AdZvNo0I59aeI/qARpyePnhfE1hBEw==
Date:   Mon, 10 Aug 2020 16:52:52 +0000
Message-ID: <OSBPR01MB5048293919411E2B5498EC9CAA440@OSBPR01MB5048.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44bd2269-4d3f-4b4a-150c-08d83d4dd2b0
x-ms-traffictypediagnostic: OSAPR01MB2098:
x-microsoft-antispam-prvs: <OSAPR01MB20989AD7618F7AFAA6F5BE20AA440@OSAPR01MB2098.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KSgwBra6fuM8X6SoTyaOwXcTG9Wlvhx86vvfjUUifR5bh5x2vItVpjkiSxt00+FDDSDo8G+0yRPu+NdIy/ZomL252OLw0bdne+KybzkZyQVH0hF439RherxeNPWVAde+Ws5vy5QTIK5JWiJW2y4ioWnfyngsEIVgbDoBEsNqqA3aQpgm6Uv1+svT7WOFnNimCD1siQs8oKgFfCqs8Cz0qi6DJDnfy066MQOGcoAVy8Keek7fWLiT8J56HKJCvWkCBQi6L6IM0iptC/tuAbGwwc/fgQePkLnRzq025JatNS9zu8yKNP6gImQDEEQF2pf9NWdmCaDHiKhHKYpfCjNkkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(2906002)(186003)(83380400001)(52536014)(4326008)(86362001)(26005)(5660300002)(66476007)(66946007)(66446008)(7696005)(53546011)(6506007)(8936002)(64756008)(66556008)(33656002)(478600001)(316002)(8676002)(76116006)(54906003)(55016002)(7416002)(9686003)(110136005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: uKsRNvy+KLRNvoGwrmBvesspvqTtcCw+P2oLuzmE64VoxeZkdI/QmTSJAoAQ+vhnWEHHE7YHepZPNbFcVjjaq7aMs2TuoExMiXGXWKl0Q5qJG3m8zOXMfWs5+Y45L1SyFAa+w/72vcFlYy3i+ZBLtpQmkF0lNMZ29HVIgn0C2wT58tlkMFD36VqzSfWBBNAzLl6TcoeDzV0mqMq52kXwK6KaloorX3mNQvCrTPUT+TTEqi/pla6UdrWvtCESmcb3ZsCffvTtgVJu8F8nJYXvrbul3+fDLB7jXbyao5RHbiUrFv4WDx9Sx/1nuXDaOwofPhJBJmcj203Pu1pjfImg/nkWz3HICZ3DIhNUiPyFdikKF/VYG38a5OyTVJs5d07QiUgY4uFlPWKb32PHVqv/laM3ff8eKNT9A703UzCtwOFCsy+965od0GYk4RBfAVB+AjTONmmfxMIBEo0mlIP0wj3w2nlj+eT789aMPMFZKxBg5qZxGi5CxpB87q6A/7aF4p9ESDzoZmIuXPl+gW3L94EGfFPHxzWcm42esi8mNYUP3/ULP9sEgs0Lg84gZqSwskt6Clb+DdPbkj0cmC/BFefmIA4SemCvjil1PFOCW+MRhLVtyIfjJuGdxqc/O0UKi4AsfhuWnlBB822MM1tPZQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bd2269-4d3f-4b4a-150c-08d83d4dd2b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 16:52:52.7577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3rmp7ZcYtKAdG45Rp3KYUUfZj6LeMS+TqiFgB/7WTC/h6CVzMwAKya1YaSlO1x1LJ9HknAnpI0oK7DuiDW7yWqOHC46pO+5Cj7mx0/rta0Fwpmu+o6f/IxYhI12bh4Q
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
