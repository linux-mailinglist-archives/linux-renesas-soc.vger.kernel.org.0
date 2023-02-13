Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DC7694672
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 14:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbjBMNBO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 08:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjBMNBN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 08:01:13 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2137.outbound.protection.outlook.com [40.107.117.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD0811EB7;
        Mon, 13 Feb 2023 05:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zc7GijQBtB6uf8jEqQZJEIsjUV8iHevMfw+Dou8IQi4T95iaPt65hkAsANPi8sDXrai3HQunr8tzvI0OcDqpRSIMhg6EuIH8PwU8oSyROHxhRBGe6PyvhvBjrBz7Lew8VdNbpVdDG3lg9ytuiBz0P6Wn19mSmY5nVfgkPax8/GLpO8cuyzSRiuCcpuaOyZtS1wNXPjiZQVR9PMRkAWM+Ixc5u127S7AGXUeir0SrNR2dMS0l9To2fXClWcBNMmhdU4WKxEZvokDBKPqnnICxc96XZITAZd/a6ZfiFod+UdIE93PBckiKKuMKoetf3uFHSg5kny7a957SsbLAyu0d/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwPpSkUAaSRdjzEjE87foIsjpVULE3CLIIkWOc9x3tk=;
 b=UU+8vkw8zRNNYFQi55anifkO6YR/zsWr2RbRbVfnBdlG7aTo7T3ad+KUkjXln16btIt3qm1c6WqIfwHWCDr+j+uLJMgX/j9E5FIzduG0wZVQyPHeF2cmKZLmOPypN4Ld53Z7pTDiV3ZyrZCvImgnIFNEWQfcYaAiJKwKjiTDDUBmqudn+32nbjA5W71XaGfZJFyDmMcGYpApHWEqa+/5O9OO2rVdsNASnz9eVKtuaJqOjVt0EMw724tM8gPo2shkoHqkYMH06FJJXeePJGkO3eFsB1OGCRWiEA8WrD+haRrRd7ZhUoPImSHFSrB6bIqaXCGtlNBBOcIaa8qQONqoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwPpSkUAaSRdjzEjE87foIsjpVULE3CLIIkWOc9x3tk=;
 b=t3htvTiEEqkQw649BTm/k663DK0/CMoLP74Jbd7wibdkZ9qQTJlXXgR+8oSt2gbdqiIqIhi0y1tR/F1b1SzpMF2avd13+U1ZgXyLDSQE90px1EVyINhXnKvsttupn7KOZT1+C+RIMS+ZmviMpkEoPucXN6zNjuBMR1WOHtmvIss=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10751.jpnprd01.prod.outlook.com (2603:1096:400:298::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 13:01:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 13:01:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
CC:     Jiri Slaby <jirislaby@kernel.org>,
        =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Topic: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Index: AQHZPY8kj9QN2R7bt0udUTepz/GAba7Mkw8AgAAAZ9CAAAeJgIAAAGyAgAAAnACAAAB4EIAAC5aAgAAAy7CAAAghgIAAKhlA
Date:   Mon, 13 Feb 2023 13:01:06 +0000
Message-ID: <OS0PR01MB592203B32464BE32BC55562886DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
 <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
 <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+oJkcP2e5a9H7fr@oden.dyn.berto.se>
 <OS0PR01MB5922EFD04CDA5EE790CE2B0086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+oRDb8DzgUhu6U6@oden.dyn.berto.se>
In-Reply-To: <Y+oRDb8DzgUhu6U6@oden.dyn.berto.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10751:EE_
x-ms-office365-filtering-correlation-id: 5c94108f-4d25-4bae-264a-08db0dc25eae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s0mYJQ7CamidH10zhdJCXRw9kJ8Vjq1qpq3gUEMdFccl1vGGA1jd8CNBUZYeIOGjV/FvdYHeQutypZXej89bjYnBVjro5L5R6G7H2uJl0BIdEa1rt+mYMPNBtkhWh9y44Ous7LRC6b1oxxOckc2WN2uZ0GoKlG55ayTtcDx87u9UWGNZRzeagM3HDSd21so21Cp76TZ/d9Rhp5Gr+gsOWw0YP4WqAGNcV2HorYG53m7HnLIt56XFkSl01gjROf6uxMPG+wf1RpTH2jUCKo991dzy0skvASnJCpDn24pRT0QJgOaKpoN7OFXWEotaeQhI8uVeYlMn7BpyEfcaQMB+0jJeWPTX3ogKGkTsjfhNPuBj3w3os3BKIDpYLCoHtwErWWTm3dc412/xaasLsUER0ebdU/wR+hiH/m9Fup1pGJx7o9f5sHDpMzoiaU2VHEnMUJZh7MnuJAN9wdUH18VUAo9kXHHIkIshXSPiYqGYhG3l44ifrKUuo0HIVCubHF1z9yfwzoMzt8cZWOPDNDoFc8mN48Su4ZH4mqvBwRqFQ75gKYTrFqOfBHub+tCmJhySNzpAPLOjITf1ARDT5WeB6yysGyH2gLqSwFIz9od485i98gP2n/cuEsq1zgXuZGQWoOad7UPBbs3hdlym4SdlpO3YXlnB+Wml0nBTD2/k0srt4jf0jHqX4jOVjXPPkSb+bsMPK3AxrSG9aPhxfKjfk3GGrfIbDcOctds2qH46Z+Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199018)(66446008)(38100700002)(122000001)(38070700005)(316002)(8936002)(66476007)(66556008)(6916009)(8676002)(64756008)(4326008)(41300700001)(76116006)(30864003)(2906002)(66946007)(5660300002)(52536014)(478600001)(966005)(7696005)(26005)(53546011)(186003)(6506007)(9686003)(54906003)(86362001)(83380400001)(45080400002)(66574015)(71200400001)(55016003)(33656002)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MXjaZNUgf3WRr2tDz5QeoLY9Gl/vDkH1yj6Av/3rzz9TIyZ8zceABYW2TX?=
 =?iso-8859-1?Q?Rie1K0sx+VXMCZ5f1/hjV2N9jk5PyCoF5qWWhE2LkoWLmJf//HUutO404F?=
 =?iso-8859-1?Q?SqV/GPl4te5knEPOUsTFKiGVhvlqfxeS42lrTTYNIEKmolWJGJaE0GgL3o?=
 =?iso-8859-1?Q?BGN6b9XQDMO2PYJ/1Yx2qraynyvReE0AeQSVtKeL5aJkNsYxHEUxjLvYrP?=
 =?iso-8859-1?Q?u+GPxuHUbpQWpDT3tGs6CcZskURLuKzJ6idcATfEO+o1eFmL8gzDWXQgAv?=
 =?iso-8859-1?Q?8xw9xQx4/N9T01NVNxb6q/mCgv9uEaiy2O0E8sU89PFRXAj5tm5RgVN3zJ?=
 =?iso-8859-1?Q?XaZQFWUnGrUumziRiRduwMV7ZpM981o1a4guorF+KPqL/AUG1f95wEph0C?=
 =?iso-8859-1?Q?i52cvoD38XScl1lBhvWznMjXOBQo1qm+g/EpoMcTc72goTY6fdT1UWt0bZ?=
 =?iso-8859-1?Q?uWoJ1TeHPL/Obu02hU+XkQrn0zIAs8LTM68QaJRtExy9EILfSR46syRDDK?=
 =?iso-8859-1?Q?H6pf6vk24oPgsk1HZ8/DDSJkLXJ/Rl29sn74FNzqzAbPqTbBfeAo7Izm2n?=
 =?iso-8859-1?Q?7TCGnwxtxsYtRgokA1gQEE1gHbajITGBCIRdFN8/JdRWOWvnlPHWIdk6tW?=
 =?iso-8859-1?Q?hVxKqrj2qSGpXjfRGzDpdy3F2O7J3dDcZ16FLknRZstzHaHpCVimrzZbFs?=
 =?iso-8859-1?Q?ur+XMCScU0raBKKbAGR81JBU4tH6W5aTsFbqiqHyZPyWXbXATZJ1gycl9W?=
 =?iso-8859-1?Q?aPox2BKL974xrzhErc99H5B5tnnLyNHfbVyYDl2LapGWNbKiwRF3bCkGtD?=
 =?iso-8859-1?Q?/3TYqbz2TNSGjcSQnsXTVv4V7YMpqfPwjSLiwTWxJahcPfeD0A1kDHrCk7?=
 =?iso-8859-1?Q?GMdm1OBy2FpPX4IBFcXRgkDfoKT/wM/YNDUMVx/oi5L0NTH40ohAHmBT1E?=
 =?iso-8859-1?Q?SHJV4sycxuOM8BuiOxcmNQupisIWw3/it3hNUv75jgaX+k7st6UlvQtbz3?=
 =?iso-8859-1?Q?1nWhi9XmgivCbLe1pxWsqGERNvJx4KXXGNiybFACSOgtkuNxUoYD/uJ9Dc?=
 =?iso-8859-1?Q?G/KGsJ0ybBNuKY1Wj4A7Uf70c3QX7/8GhzR4GayMsjWjHMpVtUQCTV73UO?=
 =?iso-8859-1?Q?jlxViiYFIcloHWn7Qk3VpAKbwJa0gHVgC+6PEXpR3LakJx46QaToYyMjWO?=
 =?iso-8859-1?Q?pHophu2pysqD4+emTwu32uYo/p8LD/SKBRAH2+yZ/zrNSXIfnZn6qG+MbA?=
 =?iso-8859-1?Q?5Uv9qjFHGawKtNSk+rTWA/mWSRbpfk7OtUqJvmyA+UNfbpiH4r3+9yzDdQ?=
 =?iso-8859-1?Q?eCgH4PcM0q/9BV/VEUdxwkzSr/3HA5ABp9Zxqv0xAjhS4Lm5jucXr1dz/H?=
 =?iso-8859-1?Q?S9ikoqIjWpCO053qvEngbyF9nOnnh2sQkerxWOXieRWOws/RGF7ACgxIy4?=
 =?iso-8859-1?Q?/Wgiwe3cMZmNfLefoXovlCx1OsbRmg/7eD2A7jDmcNbVhQivFSWtkx+Lpp?=
 =?iso-8859-1?Q?30WTEb7o02jt70hJUO0rx3CiaQmVhTLkPiTERtnmSL4+RqCzWD/yjYPT34?=
 =?iso-8859-1?Q?igcqACO2aZNbMk6v+QKQM+dj2rVOM1CwoE+TFxwqBEgpGfStmHEx9nv6nm?=
 =?iso-8859-1?Q?j98gh2wlD/onw5R99O98RGfH/WyrPJ79W/WgjR95Y7CkhPDFMn5i0vnw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c94108f-4d25-4bae-264a-08db0dc25eae
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 13:01:06.5876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwwtTd6lL+HzHtpGACZ9gq6NTSJvrUWYyuOL8H+vrTavAnmpMScN2n+tFJti+rEpNUE40Of/vep+CPY2b24eVK4ySXoz9LaelKHWu4Ddw8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10751
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

> -----Original Message-----
> From: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>
> Sent: Monday, February 13, 2023 10:30 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Jiri Slaby <jirislaby@kernel.org>; Ilpo J=E4rvinen
> <ilpo.jarvinen@linux.intel.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; Greg Kroa=
h-
> Hartman <gregkh@linuxfoundation.org>; linux-serial <linux-
> serial@vger.kernel.org>; Fabrizio Castro <fabrizio.castro.jz@renesas.com>=
;
> linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> serial8250_em_hw_info
>=20
> Hi Biju,
>=20
> On 2023-02-13 10:06:04 +0000, Biju Das wrote:
> > Hi Niklas,
> >
> > Thanks for testing.
> >
> > > -----Original Message-----
> > > From: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>
> > > Sent: Monday, February 13, 2023 9:58 AM
> > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > Cc: Jiri Slaby <jirislaby@kernel.org>; Ilpo J=E4rvinen
> > > <ilpo.jarvinen@linux.intel.com>; Geert Uytterhoeven
> > > <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; Greg
> > > Kroah- Hartman <gregkh@linuxfoundation.org>; linux-serial <linux-
> > > serial@vger.kernel.org>; Fabrizio Castro
> > > <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org
> > > Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to
> > > struct serial8250_em_hw_info
> > >
> > > Hi Biju,
> > >
> > > On 2023-02-13 09:31:27 +0000, Biju Das wrote:
> > > > Adding Magnus and Niklas to test on EMMA mobile platform to check
> > > > the port type detected On that platform?
> > >
> > > I don't know what you want me to check, I don't know much about
> > > serial. I wired up the platform during the weekend, here is a boot
> > > log running on v6.1. If you want to to check / test something I'm
> > > happy to, but will need instructions.
> >
> > As per Geert the register layout is same as RZ/V2M, So The UART is
> > register compatible with standard 16750 chip.
> >
> > But below log shows that it is 16550A and using only 16-bytes fifo,
> > Eventhough it has 64-bytes fifo.
> >
> > [    1.020000] e1020000.serial: ttyS0 at MMIO 0xe1020000 (irq =3D 37,
> base_baud =3D 796444) is a 16550A
> > [    1.020000] e1030000.serial: ttyS1 at MMIO 0xe1030000 (irq =3D 38,
> base_baud =3D 7168000) is a 16550A
> > [    1.690000] printk: console [ttyS1] enabled
> > [    1.700000] e1040000.serial: ttyS2 at MMIO 0xe1040000 (irq =3D 39,
> base_baud =3D 14336000) is a 16550A
> > [    1.710000] e1050000.serial: ttyS3 at MMIO 0xe1050000 (irq =3D 40,
> base_baud =3D 2389333) is a 16550A
> >
> > So if you apply, this patch series, and add below changes it should
> > detect as 16750
> >
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Flinux-renesas-soc%2F8585f736-cf3b-b63c-753f-892d4051ada3
> > %40linux.intel.com%2FT%2F%23mce8d222e3670321e8a8e39faacc4d6dd061fdbd6&
> > data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cc1ababd7ffba4fa1f28608d=
b
> > 0dad34ad%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6381188097859699
> > 13%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> > 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D2NYFF9vLvkFSifCl4WYUfT1=
i
> > ad8oyUFegJgFclRdDOw%3D&reserved=3D0
> >
> > and for quick testing please do below change for emma mobile.
> >
> > + { .compatible =3D "renesas,em-uart", .data =3D &rzv2m_uart_hw_info },
>=20
>=20
> Could you provide a branch with the setup you like me to test?

Please get files from here

https://gitlab.com/bijud/uart-fifo/-/commits/uart-fifo-testing

Cheers,
Biju


>=20
> >
> > Cheers,
> > Biju
> >
> >
> >
> > >
> > > [    0.000000] Booting Linux on physical CPU 0x0
> > > [    0.000000] Linux version 6.1.0 (neg@sleipner) (arm-linux-gnueabih=
f-
> gcc
> > > (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35.1) #1 SMP Sun Feb 12
> > > 18:44:55 CET
> > > 2023
> > > [    0.000000] CPU: ARMv7 Processor [411fc092] revision 2 (ARMv7),
> > > cr=3D10c5387d
> > > [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> > > instruction cache
> > > [    0.000000] OF: fdt: Machine model: EMEV2 KZM9D Board
> > > [    0.000000] printk: debug: ignoring loglevel setting.
> > > [    0.000000] Memory policy: Data cache writealloc
> > > [    0.000000] cma: Failed to reserve 128 MiB
> > > [    0.000000] Zone ranges:
> > > [    0.000000]   Normal   [mem 0x0000000040000000-0x0000000047ffffff]
> > > [    0.000000]   HighMem  empty
> > > [    0.000000] Movable zone start for each node
> > > [    0.000000] Early memory node ranges
> > > [    0.000000]   node   0: [mem 0x0000000040000000-0x0000000047ffffff=
]
> > > [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-
> > > 0x0000000047ffffff]
> > > [    0.000000] percpu: Embedded 13 pages/cpu s32468 r0 d20780 u53248
> > > [    0.000000] pcpu-alloc: s32468 r0 d20780 u53248 alloc=3D13*4096
> > > [    0.000000] pcpu-alloc: [0] 0 [0] 1
> > > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
> 32512
> > > [    0.000000] Kernel command line: ignore_loglevel rw root=3D/dev/nf=
s
> ip=3Don
> > > [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 6553=
6
> > > bytes, linear)
> > > [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768
> bytes,
> > > linear)
> > > [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:of=
f
> > > [    0.000000] Memory: 116072K/131072K available (8192K kernel code,
> 1152K
> > > rwdata, 2436K rodata, 1024K init, 259K bss, 15000K reserved, 0K cma-
> > > reserved, 0K highmem)
> > > [    0.000000] trace event string verifier disabled
> > > [    0.000000] rcu: Hierarchical RCU implementation.
> > > [    0.000000] rcu: 	RCU event tracing is enabled.
> > > [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to
> > > nr_cpu_ids=3D2.
> > > [    0.000000] rcu: RCU calculated value of scheduler-enlistment dela=
y
> is 10
> > > jiffies.
> > > [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
> nr_cpu_ids=3D2
> > > [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> > > [    0.000000] GIC: enabling workaround for broken byte access
> > > [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
> > > contention.
> > > [    0.000000] timer_probe: no matching timers found
> > > [    0.000000] Console: colour dummy device 80x30
> > > [    0.000000] printk: console [tty0] enabled
> > > [    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns,
> wraps
> > > every 21474836475000000ns
> > > [    0.000000] Calibrating delay loop (skipped) preset value.. 1066.0=
0
> > > BogoMIPS (lpj=3D5330000)
> > > [    0.000000] pid_max: default: 32768 minimum: 301
> > > [    0.000000] Mount-cache hash table entries: 1024 (order: 0, 4096
> bytes,
> > > linear)
> > > [    0.000000] Mountpoint-cache hash table entries: 1024 (order: 0, 4=
096
> > > bytes, linear)
> > > [    0.000000] CPU: Testing write buffer coherency: ok
> > > [    0.000000] CPU0: Spectre v2: using BPIALL workaround
> > > [    0.000000] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> > > [    0.000000] Setting up static identity map for 0x40100000 -
> 0x40100060
> > > [    0.000000] rcu: Hierarchical SRCU implementation.
> > > [    0.000000] rcu: 	Max phase no-delay instances is 1000.
> > > [    0.000000] smp: Bringing up secondary CPUs ...
> > > [    0.000000] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> > > [    0.000000] CPU1: Spectre v2: using BPIALL workaround
> > > [    0.000000] smp: Brought up 1 node, 2 CPUs
> > > [    0.000000] SMP: Total of 2 processors activated (2132.00 BogoMIPS=
).
> > > [    0.000000] CPU: All CPU(s) started in SVC mode.
> > > [    0.000000] devtmpfs: initialized
> > > [    0.000000] VFP support v0.3: implementor 41 architecture 3 part 3=
0
> > > variant 9 rev 1
> > > [    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles:
> > > 0xffffffff, max_idle_ns: 19112604462750000 ns
> > > [    0.000000] futex hash table entries: 512 (order: 3, 32768 bytes,
> linear)
> > > [    0.000000] pinctrl core: initialized pinctrl subsystem
> > > [    0.000000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> > > [    0.000000] DMA: preallocated 256 KiB pool for atomic coherent
> > > allocations
> > > [    0.000000] thermal_sys: Registered thermal governor 'step_wise'
> > > [    0.000000] No ATAGs?
> > > [    0.000000] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1
> > > watchpoint registers.
> > > [    0.000000] hw-breakpoint: maximum watchpoint size is 4 bytes.
> > > [    0.000000] sh-pfc e0140200.pinctrl: emev2_pfc support registered
> > > [    0.000000] SCSI subsystem initialized
> > > [    0.000000] libata version 3.00 loaded.
> > > [    0.000000] usbcore: registered new interface driver usbfs
> > > [    0.000000] usbcore: registered new interface driver hub
> > > [    0.000000] usbcore: registered new device driver usb
> > > [    0.000000] mc: Linux media interface: v0.10
> > > [    0.000000] videodev: Linux video capture interface: v2.00
> > > [    0.000000] pps_core: LinuxPPS API ver. 1 registered
> > > [    0.000000] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
> Rodolfo
> > > Giometti <giometti@linux.it>
> > > [    0.000000] PTP clock support registered
> > > [    0.000000] em_sti e0180000.timer: used for clock events
> > > [    0.000000] em_sti e0180000.timer: used for oneshot clock events
> > > [    0.000000] em_sti e0180000.timer: used as clock source
> > > [    0.000000] clocksource: e0180000.timer: mask: 0xffffffffffff
> max_cycles:
> > > 0x1ef4687b1, max_idle_ns: 112843571739654 ns
> > > [    0.000000] Advanced Linux Sound Architecture Driver Initialized.
> > > [    0.000000] vgaarb: loaded
> > > [    0.940000] clocksource: Switched to clocksource e0180000.timer
> > > [    0.950000] Clockevents: could not switch to one-shot mode:
> > > [    0.950000] Clockevents: could not switch to one-shot mode:
> dummy_timer
> > > is not functional.
> > > [    0.950000]  dummy_timer is not functional.
> > > [    0.960000] NET: Registered PF_INET protocol family
> > > [    0.960000] IP idents hash table entries: 2048 (order: 2, 16384
> bytes,
> > > linear)
> > > [    0.960000] tcp_listen_portaddr_hash hash table entries: 512 (orde=
r:
> 0,
> > > 4096 bytes, linear)
> > > [    0.960000] Table-perturb hash table entries: 65536 (order: 6, 262=
144
> > > bytes, linear)
> > > [    0.960000] TCP established hash table entries: 1024 (order: 0, 40=
96
> > > bytes, linear)
> > > [    0.960000] TCP bind hash table entries: 1024 (order: 2, 16384 byt=
es,
> > > linear)
> > > [    0.960000] TCP: Hash tables configured (established 1024 bind 102=
4)
> > > [    0.960000] UDP hash table entries: 256 (order: 1, 8192 bytes,
> linear)
> > > [    0.960000] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes=
,
> > > linear)
> > > [    0.960000] NET: Registered PF_UNIX/PF_LOCAL protocol family
> > > [    0.960000] RPC: Registered named UNIX socket transport module.
> > > [    0.960000] RPC: Registered udp transport module.
> > > [    0.960000] RPC: Registered tcp transport module.
> > > [    0.960000] RPC: Registered tcp NFSv4.1 backchannel transport modu=
le.
> > > [    0.960000] PCI: CLS 0 bytes, default 64
> > > [    1.000000] hw perfevents: enabled with armv7_cortex_a9 PMU driver=
, 7
> > > counters available
> > > [    1.000000] workingset: timestamp_bits=3D30 max_order=3D15 bucket_=
order=3D0
> > > [    1.000000] NFS: Registering the id_resolver key type
> > > [    1.000000] Key type id_resolver registered
> > > [    1.000000] Key type id_legacy registered
> > > [    1.000000] nfs4filelayout_init: NFSv4 File Layout Driver
> Registering...
> > > [    1.000000] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> > > Registering...
> > > [    1.000000] Block layer SCSI generic (bsg) driver version 0.4 load=
ed
> > > (major 246)
> > > [    1.000000] io scheduler mq-deadline registered
> > > [    1.000000] io scheduler kyber registered
> > > [    1.010000] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabl=
ed
> > > [    1.020000] e1020000.serial: ttyS0 at MMIO 0xe1020000 (irq =3D 37,
> > > base_baud =3D 796444) is a 16550A
> > > [    1.020000] e1030000.serial: ttyS1 at MMIO 0xe1030000 (irq =3D 38,
> > > base_baud =3D 7168000) is a 16550A
> > > [    1.690000] printk: console [ttyS1] enabled
> > > [    1.700000] e1040000.serial: ttyS2 at MMIO 0xe1040000 (irq =3D 39,
> > > base_baud =3D 14336000) is a 16550A
> > > [    1.710000] e1050000.serial: ttyS3 at MMIO 0xe1050000 (irq =3D 40,
> > > base_baud =3D 2389333) is a 16550A
> > > [    1.720000] SuperH (H)SCI(F) driver initialized
> > > [    1.730000] CAN device driver interface
> > > [    1.800000] smsc911x 20000000.ethernet eth0: MAC Address:
> > > 00:0a:a3:02:12:92
> > > [    1.810000] UDC core: g_ether: couldn't find an available UDC
> > > [    1.810000] i2c_dev: i2c /dev entries driver
> > > [    1.820000] em-i2c e0070000.i2c: Added i2c controller 0, irq 42
> > > [    1.830000] em-i2c e10a0000.i2c: Added i2c controller 1, irq 43
> > > [    1.830000] cpu cpu0: OPP table can't be empty
> > > [    1.840000] usbcore: registered new interface driver usbhid
> > > [    1.850000] usbhid: USB HID core driver
> > > [    1.850000] NET: Registered PF_INET6 protocol family
> > > [    1.860000] Segment Routing with IPv6
> > > [    1.870000] In-situ OAM (IOAM) with IPv6
> > > [    1.870000] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> > > [    1.880000] NET: Registered PF_PACKET protocol family
> > > [    1.880000] can: controller area network core
> > > [    1.890000] NET: Registered PF_CAN protocol family
> > > [    1.890000] can: raw protocol
> > > [    1.900000] can: broadcast manager protocol
> > > [    1.900000] can: netlink gateway - max_hops=3D1
> > > [    1.900000] Key type dns_resolver registered
> > > [    1.910000] Registering SWP/SWPB emulation handler
> > > [    1.920000] input: gpio_keys as
> /devices/platform/gpio_keys/input/input0
> > > [    1.980000] SMSC LAN8700 20000000.ethernet-ffffffff:01: attached P=
HY
> > > driver (mii_bus:phy_addr=3D20000000.ethernet-ffffffff:01, irq=3DPOLL)
> > > [    2.020000] smsc911x 20000000.ethernet eth0: SMSC911x/921x identif=
ied
> at
> > > 0xc8920000, IRQ: 41
> > > [    4.160000] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes read=
y
> > > [    4.210000] Sending DHCP requests ., OK
> > > [    4.250000] IP-Config: Got DHCP answer from 10.0.1.1, my address i=
s
> > > 10.0.1.2
> > > [    4.260000] IP-Config: Complete:
> > > [    4.260000]      device=3Deth0, hwaddr=3D00:0a:a3:02:12:92,
> ipaddr=3D10.0.1.2,
> > > mask=3D255.255.255.0, gw=3D10.0.1.1
> > > [    4.270000]      host=3D10.0.1.2, domain=3Ddyn.berto.se, nis-
> domain=3D(none)
> > > [    4.280000]      bootserver=3D10.0.1.1, rootserver=3D10.0.1.1,
> > > rootpath=3D/srv/nfs4/arch,tcp,v3
> > > [    4.280000]      nameserver0=3D192.168.20.1
> > > [    4.290000] ALSA device list:
> > > [    4.290000]   No soundcards found.
> > > [    4.320000] VFS: Mounted root (nfs filesystem) on device 0:15.
> > > [    4.320000] devtmpfs: mounted
> > > [    4.330000] Freeing unused kernel image (initmem) memory: 1024K
> > > [    4.390000] Run /sbin/init as init process
> > > [    4.390000]   with arguments:
> > > [    4.390000]     /sbin/init
> > > [    4.400000]   with environment:
> > > [    4.400000]     HOME=3D/
> > > [    4.400000]     TERM=3Dlinux
> > > [    6.040000] systemd[1]: System time before build time, advancing
> clock.
> > > [    6.100000] systemd[1]: Failed to find module 'autofs4'
> > > [    6.220000] systemd[1]: systemd 252.5-1-arch running in system mod=
e
> (+PAM
> > > +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS
> > > ++OPENSSL +ACL BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD
> > > ++LIBCRYPTSETUP LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +TPM2
> > > ++BZIP2 +LZ4 +XZ +ZLIB ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP
> > > +-SYSVINIT default-hierarchy=3Dunified)
> > > [    6.240000] systemd[1]: Detected architecture arm.
> > > [    6.290000] systemd[1]: Hostname set to <arm>.
> > > [    6.520000] systemd[1]: bpf-lsm: BPF LSM hook not enabled in the
> kernel,
> > > BPF LSM not supported
> > > [    8.710000] systemd[1]: Queued start job for default target Graphi=
cal
> > > Interface.
> > > [    8.730000] systemd[1]: Created slice Slice /system/getty.
> > > [    8.770000] systemd[1]: Created slice Slice /system/modprobe.
> > > [    8.810000] systemd[1]: Created slice Slice /system/serial-getty.
> > > [    8.850000] systemd[1]: Created slice User and Session Slice.
> > > [    8.890000] systemd[1]: Started Dispatch Password Requests to Cons=
ole
> > > Directory Watch.
> > > [    8.930000] systemd[1]: Started Forward Password Requests to Wall
> > > Directory Watch.
> > > [    8.970000] systemd[1]: Arbitrary Executable File Formats File Sys=
tem
> > > Automount Point was skipped because of an unmet condition check
> > > (ConditionPathExists=3D/proc/sys/fs/binfmt_misc).
> > > [    8.980000] systemd[1]: Reached target Local Encrypted Volumes.
> > > [    9.020000] systemd[1]: Reached target Local Integrity Protected
> Volumes.
> > > [    9.060000] systemd[1]: Reached target Network is Online.
> > > [    9.100000] systemd[1]: Reached target Path Units.
> > > [    9.130000] systemd[1]: Reached target Slice Units.
> > > [    9.170000] systemd[1]: Reached target Swaps.
> > > [    9.200000] systemd[1]: Reached target Local Verity Protected
> Volumes.
> > > [    9.240000] systemd[1]: Listening on Device-mapper event daemon
> FIFOs.
> > > [    9.300000] systemd[1]: Listening on Process Core Dump Socket.
> > > [    9.340000] systemd[1]: Journal Audit Socket was skipped because o=
f
> an
> > > unmet condition check (ConditionSecurity=3Daudit).
> > > [    9.350000] systemd[1]: Listening on Journal Socket (/dev/log).
> > > [    9.390000] systemd[1]: Listening on Journal Socket.
> > > [    9.430000] systemd[1]: Listening on udev Control Socket.
> > > [    9.470000] systemd[1]: Listening on udev Kernel Socket.
> > > [    9.510000] systemd[1]: Huge Pages File System was skipped because=
 of
> an
> > > unmet condition check (ConditionPathExists=3D/sys/kernel/mm/hugepages=
).
> > > [    9.520000] systemd[1]: POSIX Message Queue File System was skippe=
d
> > > because of an unmet condition check
> > > (ConditionPathExists=3D/proc/sys/fs/mqueue).
> > > [    9.590000] systemd[1]: Mounting /root/shared...
> > > [    9.620000] systemd[1]: Mounting Kernel Debug File System...
> > > [    9.680000] systemd[1]: Mounting Kernel Trace File System...
> > > [    9.780000] systemd[1]: Mounting Temporary Directory /tmp...
> > > [    9.820000] systemd[1]: Create List of Static Device Nodes was
> skipped
> > > because of an unmet condition check
> > > (ConditionFileNotEmpty=3D/lib/modules/6.1.0/modules.devname).
> > > [    9.850000] systemd[1]: Starting Load Kernel Module configfs...
> > > [    9.960000] systemd[1]: Starting Load Kernel Module drm...
> > > [   10.010000] systemd[1]: Starting Load Kernel Module fuse...
> > > [   10.070000] systemd[1]: Load Kernel Modules was skipped because no
> > > trigger condition checks were met.
> > > [   10.120000] systemd[1]: Starting Remount Root and Kernel File
> Systems...
> > > [   10.190000] systemd[1]: Repartition Root Disk was skipped because =
no
> > > trigger condition checks were met.
> > > [   10.250000] systemd[1]: Starting Apply Kernel Variables...
> > > [   10.310000] systemd[1]: Starting Coldplug All udev Devices...
> > > [   10.390000] systemd[1]: Mounted Kernel Debug File System.
> > > [   10.410000] systemd[1]: Mounted Kernel Trace File System.
> > > [   10.450000] systemd[1]: Mounted Temporary Directory /tmp.
> > > [   10.490000] systemd[1]: modprobe@configfs.service: Deactivated
> > > successfully.
> > > [   10.520000] systemd[1]: Finished Load Kernel Module configfs.
> > > [   10.550000] systemd[1]: modprobe@drm.service: Deactivated
> successfully.
> > > [   10.550000] systemd[1]: Finished Load Kernel Module drm.
> > > [   10.600000] systemd[1]: modprobe@fuse.service: Deactivated
> successfully.
> > > [   10.610000] systemd[1]: Finished Load Kernel Module fuse.
> > > [   10.650000] systemd[1]: Finished Remount Root and Kernel File
> Systems.
> > > [   10.670000] systemd[1]: Finished Apply Kernel Variables.
> > > [   10.890000] systemd[1]: Reached target Host and Network Name Looku=
ps.
> > > [   10.940000] systemd[1]: Listening on RPCbind Server Activation
> Socket.
> > > [   10.990000] systemd[1]: Reached target RPC Port Mapper.
> > > [   11.030000] systemd[1]: FUSE Control File System was skipped becau=
se
> of
> > > an unmet condition check (ConditionPathExists=3D/sys/fs/fuse/connecti=
ons).
> > > [   11.090000] systemd[1]: Mounting Kernel Configuration File System.=
..
> > > [   11.130000] systemd[1]: Starting NFS status monitor for NFSv2/3
> > > locking....
> > > [   11.180000] systemd[1]: First Boot Wizard was skipped because of a=
n
> unmet
> > > condition check (ConditionFirstBoot=3Dyes).
> > > [   11.210000] systemd[1]: Rebuild Hardware Database was skipped beca=
use
> of
> > > an unmet condition check (ConditionNeedsUpdate=3D/etc).
> > > [   11.290000] systemd[1]: Starting Load/Save Random Seed...
> > > [   11.330000] systemd[1]: Create System Users was skipped because no
> > > trigger condition checks were met.
> > > [   11.380000] systemd[1]: Starting Create Static Device Nodes in
> /dev...
> > > [   11.500000] systemd[1]: Finished Coldplug All udev Devices.
> > > [   11.540000] systemd[1]: Mounted Kernel Configuration File System.
> > > [   11.620000] systemd[1]: Starting RPC Bind...
> > > [   12.160000] systemd[1]: Finished Create Static Device Nodes in /de=
v.
> > > [   12.200000] systemd[1]: Started RPC Bind.
> > > [   12.240000] systemd[1]: Reached target Preparation for Local File
> > > Systems.
> > > [   12.290000] systemd[1]: Virtual Machine and Container Storage
> > > (Compatibility) was skipped because of an unmet condition check
> > > (ConditionPathExists=3D/var/lib/machines.raw).
> > > [   12.310000] systemd[1]: Reached target Local File Systems.
> > > [   12.350000] systemd[1]: Entropy Daemon based on the HAVEGE algorit=
hm
> was
> > > skipped because of an unmet condition check
> (ConditionKernelVersion=3D<5.6).
> > > [   12.360000] systemd[1]: Rebuild Dynamic Linker Cache was skipped
> because
> > > no trigger condition checks were met.
> > > [   12.420000] systemd[1]: Starting Notify NFS peers of a restart...
> > > [   12.460000] systemd[1]: Set Up Additional Binary Formats was skipp=
ed
> > > because no trigger condition checks were met.
> > > [   12.480000] systemd[1]: systemd-journald.service: unit configures =
an
> IP
> > > firewall, but the local system does not support BPF/cgroup firewallin=
g.
> > > [   12.490000] systemd[1]: (This warning is only shown for the first
> unit
> > > using IP firewalling.)
> > > [   12.570000] systemd[1]: Starting Journal Service...
> > > [   12.620000] systemd[1]: Starting Rule-based Manager for Device Eve=
nts
> and
> > > Files...
> > > [   12.700000] systemd[1]: Started NFS status monitor for NFSv2/3
> locking..
> > > [   12.740000] systemd[1]: Started Notify NFS peers of a restart.
> > > [   12.990000] systemd[1]: Started Journal Service.
> > > [   16.860000] systemd-journald[87]: Received client request to flush
> > > runtime journal.
> > > [   21.360000] random: dbus-daemon: uninitialized urandom read (12 by=
tes
> > > read)
> > > [   22.190000] random: dbus-daemon: uninitialized urandom read (12 by=
tes
> > > read)
> > > [   39.150000] random: crng init done
> > >
> > > --
> > > Kind Regards,
> > > Niklas S=F6derlund
>=20
> --
> Kind Regards,
> Niklas S=F6derlund
