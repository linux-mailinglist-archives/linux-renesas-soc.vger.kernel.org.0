Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B2C64C6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2019 20:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfGJS5Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jul 2019 14:57:24 -0400
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:4288
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727585AbfGJS5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jul 2019 14:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s0RPX6fSowVMKui/LQM+p8FXfleibYC6VqxYfCFNDM=;
 b=En/8m9ZM/VC34Ay2D02q5tYYMN2+fqsyHuClYVp0zLmnBGiPoS0bQPTPKFhOuzxLsSdpnGBFAXah+8gTbqLAlAR90ldORrcGKLLW30C8TLuNDirUEmihgsx5DHoXBsnarf9cFBqSYbUJreS14pykvcTz2MCOPKQcWTV9FmjXI2M=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1516.jpnprd01.prod.outlook.com (52.133.163.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 18:57:21 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::441a:2bf7:e01e:a247]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::441a:2bf7:e01e:a247%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 18:57:21 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH rza_u-boot-2017.05 1/2] net: sh_eth: Fix port offset on
 RZ/A2
Thread-Topic: [PATCH rza_u-boot-2017.05 1/2] net: sh_eth: Fix port offset on
 RZ/A2
Thread-Index: AQHVMn5q2BR6Pj29/0emZsbOMHJWkqbEPNnw
Date:   Wed, 10 Jul 2019 18:57:21 +0000
Message-ID: <TY1PR01MB15623DBF44D4B5452D3A69018AF00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190704153726.10507-1-geert+renesas@glider.be>
 <20190704153726.10507-2-geert+renesas@glider.be>
In-Reply-To: <20190704153726.10507-2-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctODk1NzQyZWUtYTM0NC0xMWU5LThkOWMtNWNjNWQ0NjFlNzI0XGFtZS10ZXN0XDg5NTc0MmYwLWEzNDQtMTFlOS04ZDljLTVjYzVkNDYxZTcyNGJvZHkudHh0IiBzej0iMTYyOCIgdD0iMTMyMDcyNTg2Mzc5NjAzMzA5IiBoPSJOYkcvbC93TTlBcG13TklxUVZhOFl3VDR1a2s9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c55699c9-301a-4844-2740-08d70568704b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1516;
x-ms-traffictypediagnostic: TY1PR01MB1516:
x-microsoft-antispam-prvs: <TY1PR01MB1516F65DEF238F6A8D3224088AF00@TY1PR01MB1516.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(199004)(189003)(3846002)(6246003)(4326008)(6116002)(68736007)(316002)(33656002)(2906002)(478600001)(6436002)(81156014)(81166006)(8676002)(25786009)(229853002)(53936002)(71190400001)(71200400001)(8936002)(9686003)(55016002)(99286004)(446003)(186003)(14454004)(86362001)(102836004)(76116006)(76176011)(7696005)(66946007)(66066001)(476003)(52536014)(5660300002)(11346002)(26005)(74316002)(6506007)(486006)(305945005)(7736002)(256004)(66446008)(66476007)(66556008)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1516;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9xoFBFnfvpnLBvReyo6hNGDvidki7UDUHk3SKI4Ho4kpQ8SWM6rY/KB0L4z4UffamQj42yUQZaWhtfolV1AXA0g3BFB2U4+KMsfr6fHiKRF2EmrWez36d3Xv9DIyQC7DwPdl9aaPsh2mRFFBYWqO9qCA+xgnnhrpqHGMwtDBjxOlkaHCdEDEhebCfyhY5UkBl2U0vC88nrIaHr/8nfSKHwtcIEg4ww70FHUBgPuURzVGgYBoDSht8jEYiDw4XqegXWscDTQ01ggCfX5xI35VDSu8sT6/6hMGpottjyU7jnhvmwNua7W6lOuKy7rHklpxDaVFnDMBDLknyWoQ6WLjHHbbWsr8dcZy9gl34DPPaG73PulC3HD/exFWZRnfJAJJHkR20S0T87KOwOPhpm3E3TnCuYYaXA4BEpskN/FabYQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55699c9-301a-4844-2740-08d70568704b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 18:57:21.1757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chris.Brandt@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1516
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you!

Applied.

Chris


On Thu, Jul 04, 2019 1, Geert Uytterhoeven wrote:
> The sh_eth driver assumes a hardcoded offset of 0x800 between multiple
> port instances, which is incorrect on RZ/A2.
>=20
> Fix this by making the port offset configurable, depending on SoC type.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/net/sh_eth.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/sh_eth.h b/drivers/net/sh_eth.h
> index 906d93d8e7e0421f..d20abc7873e45850 100644
> --- a/drivers/net/sh_eth.h
> +++ b/drivers/net/sh_eth.h
> @@ -366,8 +366,13 @@ static const u16
> sh_eth_offset_fast_sh4[SH_ETH_MAX_REGISTER_OFFSET] =3D {
>  #define BASE_IO_ADDR	0xE8203000
>  #elif defined(CONFIG_R7S9210)
>  #define SH_ETH_TYPE_RZ
> -#define BASE_IO_ADDR	0xE8204000	/* EDMAC0 + ETHERC0 */
> -//#define BASE_IO_ADDR	0xE8204200	/* EDMAC1 + ETHERC1 */
> +#define BASE_IO_ADDR	0xE8204000
> +#endif
> +
> +#if defined(CONFIG_R7S9210)
> +#define PORT_OFFSET	0x200
> +#else
> +#define PORT_OFFSET	0x800
>  #endif
>=20
>  /*
> @@ -674,7 +679,7 @@ static inline unsigned long sh_eth_reg_addr(struct
> sh_eth_dev *eth,
>  #else
>  #error
>  #endif
> -	return BASE_IO_ADDR + reg_offset[enum_index] + 0x800 * eth->port;
> +	return BASE_IO_ADDR + reg_offset[enum_index] + PORT_OFFSET * eth-
> >port;
>  }
>=20
>  static inline void sh_eth_write(struct sh_eth_dev *eth, unsigned long
> data,
> --
> 2.17.1

