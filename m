Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C7C64C70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2019 20:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbfGJS5e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jul 2019 14:57:34 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:13510
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727585AbfGJS5d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jul 2019 14:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b0s9K4bv981tUof3STocwMc78c469nmp+XSoSIHquI=;
 b=i6AaoFZ7tUPcWn2zPqIWK90vOkYfvoPY7GA67sdwXpvcnkxmLXyZDf3mombQWJGEpKceBea+OjHV7yBCjD/ZniN9kBoQLOgsfQeQyYjEAp8j29k/BHLrase+AEb1wRQHRClWU4UN1iexf/D224nrtFtWYojsTEg6AUvqYjudLJM=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1516.jpnprd01.prod.outlook.com (52.133.163.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 18:57:31 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::441a:2bf7:e01e:a247]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::441a:2bf7:e01e:a247%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 18:57:31 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH rza_u-boot-2017.05 2/2] rza2mevb: Use second Ethernet port
 if first one is not available
Thread-Topic: [PATCH rza_u-boot-2017.05 2/2] rza2mevb: Use second Ethernet
 port if first one is not available
Thread-Index: AQHVMn5paTJupSqV8Uu29yili7SHC6bEPR8w
Date:   Wed, 10 Jul 2019 18:57:31 +0000
Message-ID: <TY1PR01MB1562244DC85F5813340508678AF00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190704153726.10507-1-geert+renesas@glider.be>
 <20190704153726.10507-3-geert+renesas@glider.be>
In-Reply-To: <20190704153726.10507-3-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOTAyMmQwMzEtYTM0NC0xMWU5LThkOWMtNWNjNWQ0NjFlNzI0XGFtZS10ZXN0XDkwMjJkMDMzLWEzNDQtMTFlOS04ZDljLTVjYzVkNDYxZTcyNGJvZHkudHh0IiBzej0iMTI1MyIgdD0iMTMyMDcyNTg2NDkzNzkxNjU2IiBoPSJsWkZIaGlpUmMwelM1dVNoNFlsZ2F0MFhpdlk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bb140e4-261b-4fa7-5275-08d705687684
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1516;
x-ms-traffictypediagnostic: TY1PR01MB1516:
x-microsoft-antispam-prvs: <TY1PR01MB1516E5E2170CBE2714FB2C428AF00@TY1PR01MB1516.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(199004)(189003)(3846002)(6246003)(4326008)(6116002)(68736007)(316002)(33656002)(2906002)(478600001)(6436002)(81156014)(81166006)(8676002)(25786009)(229853002)(53936002)(71190400001)(71200400001)(8936002)(9686003)(55016002)(99286004)(446003)(186003)(14454004)(86362001)(102836004)(76116006)(76176011)(7696005)(66946007)(66066001)(476003)(52536014)(5660300002)(11346002)(26005)(74316002)(6506007)(486006)(305945005)(7736002)(256004)(66446008)(66476007)(66556008)(64756008)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1516;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vyGFdN2nL6K2VNujGPg4Jr1q3+2UqtSr602SELSA2p3p2hyR6tplSRtIJAtZYdszyBW+dhIG81wYCSjGdO9xSXq0jcM0tTCd9ENViyqKs9nE2ud1VTH53JLQGUA6wnx/m4maToJ2XZGrPQFMloWuEv7ze2HNVavkSxurt90VYe9AIFmhrspnBKwS9Xf5U3YlOrRyhn4ESlAuWw6bYzRwzUeBjU/e7ghLuHzzt0IxwYTSHpThFYWLmTajmcVM59o4NVmoaHTNRkkKa/DjkkYTF6G+DFGALgdVIl4pok82XgHU42Zz9AOCOuaFjArQC9OeVjtRswIZ3V+FQjO65bPdnrdhrwpyT5+piWC0qL25Ik0P6ccLIKCA0TqZrnVtG4oVrrmWsN7khVl762UvfqqtzLlzBrj2j22O0hNjB2YYbL0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb140e4-261b-4fa7-5275-08d705687684
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 18:57:31.7356
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
> When SW6-4 is switched off, the first Ethernet port is not available,
> and thus doesn't work.  Hence fall back to using the second port
> instead.
>=20
> This allows to use TFTP when SDRAM is enabled (RZA2M_ENABLE_SDRAM is
> defined), and the serial console is moved to SCIF2.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/configs/rza2mevb.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/configs/rza2mevb.h b/include/configs/rza2mevb.h
> index 7ac9b8f80e329288..a217d668eedae631 100644
> --- a/include/configs/rza2mevb.h
> +++ b/include/configs/rza2mevb.h
> @@ -216,7 +216,11 @@
>  /* Network interface */
>  #if (SW6_4 =3D=3D SW_ON) || (SW6_5 =3D=3D SW_ON)
>  #define CONFIG_SH_ETHER
> +#if (SW6_4 =3D=3D SW_ON)
>  #define CONFIG_SH_ETHER_USE_PORT	0
> +#else
> +#define CONFIG_SH_ETHER_USE_PORT	1
> +#endif
>  #define CONFIG_SH_ETHER_PHY_ADDR	0
>  #define CONFIG_SH_ETHER_PHY_MODE PHY_INTERFACE_MODE_MII
>  #define CONFIG_PHYLIB
> --
> 2.17.1

