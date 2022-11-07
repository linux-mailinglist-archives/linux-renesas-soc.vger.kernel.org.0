Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D330461EB3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 07:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbiKGGzq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 01:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiKGGzp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 01:55:45 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573E0246;
        Sun,  6 Nov 2022 22:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5GS45Sy4D0HLSb7H/+qEt8pYk14TYRyt3P/eiXIN+jEyS1nGZZ/OPZ9Gtx0xOnQSskbCAnKjUzk9VPlQJtI6Q0a6xQYmtt42E9BXC1IZwiYEo3tio732WuKWQKDis2uohZdmD8xoZeAgz11jxT2XqqDaQq5TWVvRYCcU0+osdsL1ZVzhsoOLko7WnSzNZYW4t2w2ufMAEN2Bwa1hc3wvjSROyHUodBWzAPXzIqA7Bt+2OMmC/Zxv2YLsZi2M+JbMOJ5arpaR++O2e1ZUQSN4TpjFs8LU/iMnILFWxxdvDLlAeG2t2LDcvy+WFKjPNlaM6xbzmVwwfCzuN+izitRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITadrhQ43BG43VxlJnmzayVeSJPMkyuhL+kpDEpj/ag=;
 b=YVk5Cwu8RnxKceDGiwzndVJwQwZd9zaNpWtF379fXCrwD1Eq3MZVX+eqNG2liDx5FzkA2YMVW7s8KYKSE0XT6sZfxnrnWVJqJPIXs8exOFq90AQM54EnWvjhvMxruW1JER1v45fa9RKeE8Hga9d2ZypjvpT9fNzGpRQlZ4M1M2LCC+imMattlzxVif/1A2vxUVepk7Lo6++LuTXLrpW50HdYVxZVQFRxjLuuxr2fWE9GsTVgkQRRYexj2d75pdAV8i1b1GdhnAOhEeynxwrMcRdaa0MExKSQ5pw+pson8LUN6eprIFXUWI0zQC+hwPtsdI/1tumkSbFfxKjUpH4OCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITadrhQ43BG43VxlJnmzayVeSJPMkyuhL+kpDEpj/ag=;
 b=c2xFWWkCzBLd31SnKjUmfCWeDzv/GkvIA9H1O7bt9G6hSWokVJjakw0bFXiekLcUWiHoPzYPKnDhMHYcDHT8HcNMafZS3KZGNRuSkBsZha9ReApUEcN8CND+82vTrKO7nDXHM9cTpLHNazyyF6Er1HYCl0j6yuULgf6N4j0MTcs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8065.jpnprd01.prod.outlook.com (2603:1096:604:1bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 06:55:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 06:55:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 0/5] Add RZ/G2L MTU3 Core, Counter and pwm driver
Thread-Topic: [PATCH v5 0/5] Add RZ/G2L MTU3 Core, Counter and pwm driver
Thread-Index: AQHY6hM8dYx/ee/ucUm+gD9Km/m53q4zF4EA
Date:   Mon, 7 Nov 2022 06:55:41 +0000
Message-ID: <OS0PR01MB5922534B7371AB2A2A2AE823863C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221027144844.85149-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221027144844.85149-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8065:EE_
x-ms-office365-filtering-correlation-id: 2bf87220-0e81-4164-05db-08dac08d161a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rk5iIcT8J7UeItvIK5nAVUn67TPcCuRAM6JPM9v/8UUWEYqex84k6VB07JLBWsrNMn9mFeAq7ZGW5BCQ9cPPm7BUFHu7nT1G1VxuGgG9vDglq7TxVWgqYvhNm9q1LIzgGPoUuyQvin0K52CZ8mdQEMPcGi4ZV+yb8GcF8rpNSAWCiNXqIu1N7ILRUUyctGHY/DjSCEWkZSOT2tIube/u2zdG2gmFEkO8/afGUmld0rjpwoO/F6X2/daeTtSN+zdkldUDeRi6w+ezA5anyucPp0trVg+ERWwUGE4hWxGnfL/8XfXk9/dAgbkxZ2ZL1LwuG8yCgHBfQiNb77sDPHx+HBUOjsIOsYo7vEzA1100Jalc5ovSA1qVmGxHsVZiY2qZM/199+or/e7b7ouGwcAGgoP8+ImkvxM5qbWbGVi8j5i4A0VM7YPvg44EnLmW5u9xTLBQFFVe4Gh9ZkDKr2J3ejaafn4v0y0uAh1STZLaoVH71AijET2+soudwy+0wf4qhfd2eTpO3xOllBshTopgK4cFsM7Y87Pvj4FXVhMP8uoL7og5UkyNi1+qDZDmKJ5lrKmLOGeD1sTga2NiYSgNBzNifOhXSA+4wL5xudddeluy2FY3yNI408Vw7r1prjggftSnD//eZ1HmpUPiNgNMa8th3zkVfkt1r/X4DzwF+ue7KeX11I10wbew69MbJOFLmpu1pxPvNsx0Y3452CgwUPk4RWIgIdbzQL1ZNfyiuY1DF17xqrJKEklb0cOGIVgdzwaDXEWA7UVCpQ7Ul+OI+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(316002)(33656002)(7416002)(52536014)(38100700002)(41300700001)(54906003)(110136005)(8936002)(5660300002)(76116006)(66476007)(66556008)(66946007)(2906002)(4326008)(66574015)(83380400001)(186003)(53546011)(8676002)(38070700005)(55016003)(71200400001)(7696005)(478600001)(26005)(86362001)(9686003)(6506007)(64756008)(66446008)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?poZ7vU2YmYr+V0NaQ6aJgR7BLmBJZrp8Fwhnxk8KV4vFP3qvhtnTvm+Ml+?=
 =?iso-8859-1?Q?dpaczlgc/TGi1l8gI5h5FwbYn6XN7rTPp3DbkvjWg09OzgKNJBr0KXrC5B?=
 =?iso-8859-1?Q?a/Xz8o/IipTs4asUDILy5gnAgAWthe6xz1rbdL1vbguasdft8LCBHD5prQ?=
 =?iso-8859-1?Q?MQQVVkGn8G92Fikwt5Z9wqFlD0DVjH15ijF6SO14TGDvcPWG9XEDiQ36OL?=
 =?iso-8859-1?Q?CFE+QdmvPC5tRlNJRFgzqmnGifQa4JgtKsXXshNNszM8Bf+zG+Z8pxv1D2?=
 =?iso-8859-1?Q?3Xe8VxZ0tjL31t4+h6wGE3zoi6sbG5YmFZ1AAYiTzr0woV9uP8y37v2Sd5?=
 =?iso-8859-1?Q?yyZ2Dnifcehgu5JO7S0mnMU+JnPQd/I39sPSiMaahdIm2pmGKKODclczcp?=
 =?iso-8859-1?Q?VXakLrzj+3BvKdzUEOALtvNEnCKBCc9rzIXzjVx9aZbUpLdnGmuZiN3ymg?=
 =?iso-8859-1?Q?G2vy3OJV5VL3FpwC4IG4laNMd+tTEJ8Tu7lv91jWBb1ZAE74Z5eO0GSTxT?=
 =?iso-8859-1?Q?wLWTPez+9GkgbY7nnD1HL2KRHuj87/8csPmJvzKf46qdNOCOwFwtPd+hhr?=
 =?iso-8859-1?Q?nP0rr5w1ks1otO8dXaGbcamDTmcz/JilxlGpbalUnA+AI8SYRRp4P1iDfg?=
 =?iso-8859-1?Q?iS8sx/SisR4Vt08gEaTHhoTPcHF0yNg0L50shZ/7bLB4Gl8rVVfaPjSSOU?=
 =?iso-8859-1?Q?N15zOaySBTcHMZh0rlGAG4O2vvNDyHWstHQa4s4EFC7C7FBaicLtcAviGn?=
 =?iso-8859-1?Q?CrEHibb2ynsphQx5McEr+yTUl/MmT4jUTEymxE9AgidXSJZUUzS5OOVbAS?=
 =?iso-8859-1?Q?4w1hfSdCl1jxs+KJYQJhLPqbAeKVqIvdfalGe13TgoscetTkoiokHTIMlr?=
 =?iso-8859-1?Q?snsv+xB7W9kKqJBVYvhYSDwFw6csx+hleQLGqiShd3vOAnCz1cKNQtOTXV?=
 =?iso-8859-1?Q?ZK03r+f7WUGwxyQ/ivquAgmYrq3S5eaQzwkn4jXeYAXbW6TbwMX8rggE9M?=
 =?iso-8859-1?Q?OoFxvam7tmZ/ai46xlaYQuL1EOyYM96yPhbaHeZkUbUvQPoFDveBBSD4s/?=
 =?iso-8859-1?Q?iS43kFaYu9nvo0zRTquXpp6HblE6NpKJBHrVJmV9H4liorWYye2MQY+lP8?=
 =?iso-8859-1?Q?lnx6O/ywvf6daHnb/KLoisPZnjRYLXkjFDPVCXr7nXDSSAmLZAS9B+CJJA?=
 =?iso-8859-1?Q?WKID7Gt/Z22whQbiAfFSVNKKxRv6qIJaR5NsYdNgLDbX1IG4mlYp/7Ns35?=
 =?iso-8859-1?Q?IbCcduPRbgLPH/EPrl9VRN0o2b5/YTKYhkgZpGGTX6Ot62gNS+gsDQlsAI?=
 =?iso-8859-1?Q?c2ayP2H8sVykm1r/WyBZEe6SP5IhcrHoMUyscMEnjDv7cda2lho6FLVW3a?=
 =?iso-8859-1?Q?a2iCE8jqng4b4z0d4CCNFZ6ecREm/zLwcZRdKGp4d+DPlANl1O3dGbmQBi?=
 =?iso-8859-1?Q?EFPTJRvTL5srin5ki84M6aSxacbUkOkaV7/pI6DdgKPjc7JDdlTLbOWjJD?=
 =?iso-8859-1?Q?noCLMeuJQKRqjofXoKouQykGl8nkXcmls6e/KL2lVJrBlsLWRHv5VYUfFC?=
 =?iso-8859-1?Q?JBWxzl7wgXYX/teT22PNbJI/RjQIkN2X5yaGQbNhWx9FNASjYDYI8NXPbm?=
 =?iso-8859-1?Q?+mWgx+HtaQNfkvfE74xeJ3m792fWdim4yUkIt04GXceHxkqtBDJgNv6Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf87220-0e81-4164-05db-08dac08d161a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 06:55:41.9916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sIWygm05lOaCGmAWQu6Zkavpj+QjnMCHH6fPXKJWbAuv6QLh/Mt7Tfx/rqqgGp6GjDwXUE2Vbw6CS1CXXL/Hs79Rci/YCEBXkhIdZIfMPH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8065
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Gentle ping. Are we happy with the patch series?
Please let me know.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 27 October 2022 15:49
> To: Rob Herring <robh+dt@kernel.org>; Philipp Zabel <p.zabel@pengutronix.=
de>;
> Daniel Lezcano <daniel.lezcano@linaro.org>; William Breathitt Gray
> <william.gray@linaro.org>; Thierry Reding <thierry.reding@gmail.com>; Uwe
> Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Thomas Gleixner
> <tglx@linutronix.de>; devicetree@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> renesas-soc@vger.kernel.org
> Subject: [PATCH v5 0/5] Add RZ/G2L MTU3 Core, Counter and pwm driver
>=20
> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in the
> Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer channels a=
nd
> one 32-bit timer channel. It supports the following functions
>  - Counter
>  - Timer
>  - PWM
>=20
> This patch series aim to add mtu3 core, counter and pwm driver for MTU3a.
> Mtu3 core instantiates child devices using mfd api.
>=20
> The 8/16/32 bit registers are mixed in each channel. The HW specification=
s of
> the IP is described in patch#1.
>=20
> Current patch set is tested for PWM mode1 on MTU3 channel and 16 and 32 b=
it
> phase counting modes.
>=20
> There is a plan to add clock source and clock event driver later.
>=20
> v4->v5:
>  * Modelled as timer bindings.
>  * Fixed the typo in bindings.
>  * Moved core driver from MFD to timer
>  * Child devices instatiated using mfd_add_devices()
>  * Documented sysfs entries external_input_phase_clock_select and
>    long_word_access_ctrl_mode.
>  * Updated the Kconfig with SoC vendor name
>  * Introduced rz_mtu3_is_counter_invalid()
>  * replaced pointer to an array of struct rz_mtu3_channel with
>    a simple pointer to struct rz_mtu3_channel.
>  * Added long_word_access_ctrl_mode sysfs entry for 16-bit and
>    32-bit access
>  * Added external_input_phase_clock_select sysfs entry for
>    selecting input clocks.
>  * used preprocessor defines represent SIGNAL_{A,B,C,D}_ID instead of
>    signal ids.
> v3->v4:
>  * Dropped counter and pwm compatibeles as they don't have any resources.
>  * Made rz-mtu3 as pwm provider.
>  * Updated the example and description.
>  * A single driver that registers both the counter and the pwm
>    functionalities that binds against "renesas,rz-mtu3".
>  * Moved PM handling from child devices to here.
>  * replaced include/linux/mfd/rz-mtu3.h->drivers/mfd/rz-mtu3.h
>  * Removed "remove" callback from mfd driver
>  * There is no resource associated with "rz-mtu3-counter" and "rz-mtu3-pw=
m"
>    compatible and moved the code to mfd subsystem as it binds against "rz=
-
> mtu".
>  * Removed struct platform_driver rz_mtu3_cnt_driver.
>  * Removed struct platform_driver rz_mtu3_pwm_driver.
>  * Updated commit description
>  * Updated Kconfig description
>  * Added macros RZ_MTU3_16_BIT_MTU{1,2}_CH for MTU1 and MTU2 channels
>  * Added RZ_MTU3_GET_HW_CH macro for getting channel ID.
>  * replaced priv->ch[id]->priv->ch[0] in rz_mtu3_count_read()
>  * Cached counter max values
>  * replaced cnt->tsr in rz_mtu3_count_direction_read()
>  * Added comments for RZ_MTU3_TCR_CCLR_NONE
>  * Replaced if with switch in rz_mtu3_initialize_counter() and
>    rz_mtu3_count_ceiling_write()
>  * Added locks in initialize, terminate and enable_read to prevent races.
>  * Updated rz_mtu3_action_read to take care of MTU2 signals.
>  * Added separate distinct array for each group of Synapse.
>  * Moved pm handling to parent.
> v2->v3:
>  * Dropped counter bindings and integrated with mfd as it has only one
> property.
>  * Removed "#address-cells" and "#size-cells" as it do not have children =
with
>    unit addresses.
>  * Removed quotes from counter and pwm.
>  * Provided full path for pwm bindings.
>  * Updated the binding example.
>  * removed unwanted header files
>  * Added LUT for 32 bit registers as it needed for 32-bit cascade countin=
g.
>  * Exported 32 bit read/write functions.
>  * Modelled as a counter device supporting 3 counters(2 16-bit and
>    32-bit)
>  * Add kernel-doc comments to document struct rz_mtu3_cnt
>  * Removed mmio variable from struct rz_mtu3_cnt
>  * Removed cnt local variable from rz_mtu3_count_read()
>  * Replaced -EINVAL->-ERANGE for out of range error conditions.
>  * Removed explicit cast from write functions.
>  * Removed local variable val from rz_mtu3_count_ceiling_read()
>  * Added lock for RMW for counter/ceiling updates.
>  * Added different synapses for counter0 and counter{1,2}
>  * Used ARRAY for assigning num_counts.
>  * Added PM runtime for managing clocks.
>  * Add MODULE_IMPORT_NS(COUNTER) to import the COUNTER namespace.
>=20
> RFC->v2:
>  * replaced devm_reset_control_get->devm_reset_control_get_exclusive
>  * Dropped 'bindings' from the binding title
>  * Updated the binding example
>  * Added additionalProperties: false for counter bindings
>  * Squashed all the binding patches
>  * Modelled as a single counter device providing both 16-bit
>    and 32-bit phase counting modes
>  * Modelled as a single pwm device for supporting different pwm modes.
>  * Moved counter and pwm bindings to respective subsystems.
>=20
>=20
> Biju Das (5):
>   dt-bindings: timer: Document RZ/G2L MTU3a bindings
>   clocksource/drivers: Add RZ/G2L MTU3 core driver
>   Documentation: ABI: sysfs-bus-counter: add
>     external_input_phase_clock_select & long_word_access_ctrl_mode items
>   counter: Add RZ/G2L MTU3 counter driver
>   pwm: Add support for RZ/G2L MTU3 PWM
>=20
>  Documentation/ABI/testing/sysfs-bus-counter   |  16 +
>  .../bindings/timer/renesas,rz-mtu3.yaml       | 302 ++++++++
>  drivers/clocksource/Kconfig                   |  10 +
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/rz-mtu3.c                 | 440 +++++++++++
>  drivers/counter/Kconfig                       |  11 +
>  drivers/counter/Makefile                      |   1 +
>  drivers/counter/rz-mtu3-cnt.c                 | 713 ++++++++++++++++++
>  drivers/pwm/Kconfig                           |  11 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-rz-mtu3.c                     | 461 +++++++++++
>  include/clocksource/rz-mtu3.h                 | 206 +++++
>  12 files changed, 2173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,rz-
> mtu3.yaml
>  create mode 100644 drivers/clocksource/rz-mtu3.c  create mode 100644
> drivers/counter/rz-mtu3-cnt.c  create mode 100644 drivers/pwm/pwm-rz-mtu3=
.c
> create mode 100644 include/clocksource/rz-mtu3.h
>=20
> --
> 2.25.1

