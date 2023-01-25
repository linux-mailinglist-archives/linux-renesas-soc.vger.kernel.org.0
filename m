Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD6967BAFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 20:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjAYTsi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 14:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjAYTsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 14:48:37 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2135.outbound.protection.outlook.com [40.107.255.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BE7EF88;
        Wed, 25 Jan 2023 11:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGPY7ZOBwHRU0IohUWK9zJJ+lVzKAPK2w4CpsqDdN/jr7hGZySHYuCVIgbIv4XoQWPgE904q3rwkYwoAmbbKMKVBRK8IBvpE/OTVsb/HCMFtFOxGJPTRg8WMKBwJujfMPQIOlKfOgBWOqgAs4Q2BuiwMAOCuonK+JkH8XgbRysIYSkeV6+C/vVhuHOehXU+iFQgL6j5uVvKOcIorgbhu8w3PgWq5Uxeey4XNE5Z6bCo6HGLuOgkMbdT6l0bmmpXqJSxHOPaRV0dh6QKwY25J0QFsEG/oAIw+W0CpB8XRJGoDZjpAceiHdoPWQl0BcyGFrD2amDt5MyvaALEGJVKXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ms93uuFhIQy0hcaETGEZPQWByiwq3WtNfwfo0PB274=;
 b=JYborhsWRMf0NqvP3MQ41siRk4dudYBlILGzATtCYtUJbkp7deOSK4UjhFrpTbshkmzQyAvp1nz9HZlyg0+re0DgbekxBpLZfx6nhfhkG6anIfACnJqL3gnDXUkZODBAkspEz8BqbcErqkldiFZBm19fQp6vGRzw9YxNkuYpGldQ1xH6lfpnRohnF8Bgtslcc819Wje9l03v3VTG+2TRAnEcRCxhHP56jH6QUKnxgXNN1I66vpx9Sw77E1poUcNHuFeMTa6Z7XFJcc1ct0V969AcwGkmH3wkRiM3eYel1ZO7Sq17NQCM99vVb/1L1/Wz4Sl86NNDw+S8WQ99NZF7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ms93uuFhIQy0hcaETGEZPQWByiwq3WtNfwfo0PB274=;
 b=uG8Btf0YMdPKZQF59zHpglhuFtPtLGqLVhSaXPlKyPuOTG9bKT8dgjGmgRs0shzut+xLCQyMykvH22HEXPwVdPV8Wvx/iER2EUWObgVYamm6g9kBoL0qld4KGcFFJJB3wy7tRdRT6y1c0ONT7lfsNhA63y1LG3l2lNOwiHM3hbA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8579.jpnprd01.prod.outlook.com (2603:1096:604:18d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:48:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%6]) with mapi id 15.20.6043.021; Wed, 25 Jan 2023
 19:48:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
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
Subject: RE: [PATCH v11 0/6] Add RZ/G2L MTU3a Core, Counter and pwm driver
Thread-Topic: [PATCH v11 0/6] Add RZ/G2L MTU3a Core, Counter and pwm driver
Thread-Index: AQHZJ2qdMUIbkvzYW0WIzj2bmNr4L66vmkLg
Date:   Wed, 25 Jan 2023 19:48:30 +0000
Message-ID: <OS0PR01MB5922C101756A71153EEBA8AA86CE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8579:EE_
x-ms-office365-filtering-correlation-id: 5bd671f6-e12e-41e2-624c-08daff0d225b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hhQQ2shzZp2Ijo8fB/Sk5B7lGaJv/kxWki8u+xnSsmYxB/U+xHN7nF9ZPrxauRlq481MLU6hxz/+U3MATBNN3xQqYbzNjpR98gPjb53kuB12cMZH0fUy3lkItg8RFcHmv7l11PbhqrhdjAxslOlHU1qvKUHPulwPe2Xr0xn5z7mvk34+rN5dEfpo0TqTCZoEJSSRB/CFfRJclJ/fIYU3Lm/86Ijalco9RlI/7PI40/dCOdrUeb4KNV2KCeHFDnIrCqewo/0J4XOh+ZzHq91c0JzNW69/zFEzYZi0cPJ/BCchlsljv1h88WwgLjxUdPwN3kj9sGrk1XLkOkzvXxo53cLMKr+Xg/oeZjb1/BK07TEpm6p2JHjvOi+jHsBPdUHp8eYFXqq3tWsF6pCrZh/nyXYdoOKR8cnF/Ibjwhn7NLmh1BQEJg1ThVJwHUO41jiIkPCsvpKpE2gUrfH5sux3M7Z4zyzSFjFp5KRlOatPRvPohNbPBuN9aVfLB04MC0/dpIZvbLz4O+EfpQVkBdsQOdYbEW97iOHukO9zHoR7qwsGTNFPkzHWPkcb7JFDwRfgEX1o/sYWDTe/TJxH+aMUOV15wbNmdYyZwRmFLSnFsE4ttcROH+LwhJ9eEQqnq3oZyRZnUE6L24mFmCqUyJY0fkPtlMlk5tGsJLU18mjGtrENWTm39dTkCgphov3/SK1lFgUEMAUuQshd/4UmTZn8wGqFXPpgg1KIAKAK2ij92/iDKARYwoOw8KvT/3T0NcZI6hZ80BL8hH1WSqqVeFLy3iazngxoEWlsKNyVGeCtNzw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199018)(41300700001)(52536014)(8936002)(38100700002)(122000001)(2906002)(30864003)(7416002)(5660300002)(83380400001)(6506007)(966005)(86362001)(186003)(26005)(478600001)(9686003)(7696005)(71200400001)(64756008)(66946007)(76116006)(66476007)(38070700005)(66556008)(66446008)(55016003)(4326008)(8676002)(33656002)(54906003)(316002)(110136005)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?j0EKnHNgPeU/6qAmsf6ibOyVC6vd6UI75NVXwPHLYqQO9CRMYboJ/LKayf?=
 =?iso-8859-1?Q?XNMFOoEFDhurXOCeQL1jckt8QLeKt3M6Op6f6ZnjpC5XTuOQLsBv0Kg8jD?=
 =?iso-8859-1?Q?hS76bld3eL1GmUSNxDCuw2GZIeJPJjhN/X+8PcyXbsvKtm849Qrjj2vOQG?=
 =?iso-8859-1?Q?jL5H+70EQLbc6LoCUbdM9MXnkgWoQ57xVo8vu97MJ0XtL7efW9Op551E31?=
 =?iso-8859-1?Q?pK2vEG47cRfw2HiAMhsh4Ht9FU5zRXqW2j/MqDjnmn0RnyapUrIXY7hvU6?=
 =?iso-8859-1?Q?6NpJ1CYxjf0CCRMiZAmafpoQ+QQJvIghDOpTPGVfiLY03D4TtfFKin3fCH?=
 =?iso-8859-1?Q?8onB9sFn95670ey+QIyBkV2Z0T086tLlEmM3Un/1mmJO+z+Hz/srVw+UYl?=
 =?iso-8859-1?Q?zVEckf1BnT5ksrD0BUkC1uNvsx0ToPJqyqyuVjFuBviCPtVBwFxxkrXr4o?=
 =?iso-8859-1?Q?d0jIAq3v8WaQCirT0i3HHOM7vYswNQ9J0lkONz3MAXGUI9/O3O1loXMvbW?=
 =?iso-8859-1?Q?/RiHMCXDahj3GTzeHSFZFXHBZ6kCsV+wHI3yTllS15sbopSbDPQhuKRrbE?=
 =?iso-8859-1?Q?gCrZYlxl/Af0PoxyZTqetgCYFaqoFrF3ExIM7jAL6rPQ2Zds82ZOfQXFsm?=
 =?iso-8859-1?Q?KhsrVLBcTea+ieSdJdC2sfB6+OIq2OgWiO8tg2lkrgD2pFzfEY76KxuWtS?=
 =?iso-8859-1?Q?F9E6hk7ujYZBoKUg+IsomHxNF7K8nQOoB1u9AuqbiiBPRIjV+TBbRYOHz1?=
 =?iso-8859-1?Q?GO+ie6O+wvbRZzyBBfSisOtSTP+5BFzriILXSR/dxsDSGB2Khjwmjlkq6T?=
 =?iso-8859-1?Q?iAOIClADK8mz9zC0IlRcHO2rhvx+0WMqxw/peP2jMd/1ZgCOZSv9brTVHU?=
 =?iso-8859-1?Q?eDPppcT4nHu5rtuK6C28x6E8QQZPvfttyPSdkaYD5dyAw6XJmcwLjQ74na?=
 =?iso-8859-1?Q?QnQEvCo4/0Y5yt9YLgNEjSIrMbgphinPiJLLsvQ44LAcRWE3kif1Qd/2wO?=
 =?iso-8859-1?Q?myqFXQQW8n4S+UKBSw4x7uG6hsmNJr+LC3WbQw8LNkouWmWAaP0U0PywJx?=
 =?iso-8859-1?Q?GLwKJFR/Us1AgC9R5cTbOnP+nbBwm3FPn585vMhv/P1083SENmF9J+Fglt?=
 =?iso-8859-1?Q?fYK0He//gX7m3MoOB8/v3xvWQ9PZP182LEuzdlAQ3EzUClBCUcONuDQ/o8?=
 =?iso-8859-1?Q?6NWZhc7XaSHGHawOx/17PbBVmB7mD/wrb1zJ5s+0U1mb3OoVGhwvqIXQUR?=
 =?iso-8859-1?Q?0V34lhkqFw+8HXYKgr0qXB+oRcCJmwrIj0YJwGLIGHMtmYOkNLBbaVvZ1R?=
 =?iso-8859-1?Q?MiY1av7rl19e8u2bPFOhl2Y6+RlneUHwbJS/i4xroNZ3JK+MFkOzAK1coP?=
 =?iso-8859-1?Q?UX7LUDgX8rKYLpB32v0HRiwBEiwWtPbWiJfv0HEWvcg5MzGPPPl+IpvCsb?=
 =?iso-8859-1?Q?BhPEyRxArIHvFFOSYm68SQcWa8Dxw5APjcpS9mDlh2+zQHFSQSqfoZ7Qx7?=
 =?iso-8859-1?Q?zEkVgnu+Liie5EQnkxxkJT8FwTjLVnty2dc4SU4qSUvMEMZZHwCMFQfXQK?=
 =?iso-8859-1?Q?Ds3fEtAp+8Oz7Bg4O8oprs5avnwYfmqqr0Hzc7OPnrFUnDZJCOGhfmM7E6?=
 =?iso-8859-1?Q?I5U0y+XxYZ80J9p0loGnwUL1ZHKd/35GAvEeaWZ0IZZrW18yW2njHMAQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd671f6-e12e-41e2-624c-08daff0d225b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 19:48:30.1793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6q3sANIZuqKD6a3adashwu0OZbVcGiYMLj0lAuV8qo5jAjydi1ofLVNuQKGGG31CCEvc71ewckZJLdCp9U0R5VKNHIQJJXvtoD4uBN9djw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8579
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Gentle ping.

The core driver and binding patches [1] and [2] is blocking[3], [4] and [5]=
.

Does these patches have to go via counter tree as it is the first user and
we have dependency between subsystems for this IP?

[1] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju=
.das.jz@bp.renesas.com/T/#m79afdee83fd64dfbeb27fd888361a0d6d6a26ad5

[2] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju=
.das.jz@bp.renesas.com/T/#m4d0dfa4d2700c2d6669da3289d68bcb9ce7dac71

[3] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju=
.das.jz@bp.renesas.com/T/#mb8d4b7ad8e23e795bfde15a33c28b5c0348654bc

[4] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju=
.das.jz@bp.renesas.com/T/#me3bcc56cef9cf78868e38158f8b870fa9cceff8f

[5] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju=
.das.jz@bp.renesas.com/T/#m1821926505123cd75f0b981e496d4e044cf875c3

Cheers,
Biju

> Subject: [PATCH v11 0/6] Add RZ/G2L MTU3a Core, Counter and pwm driver
>=20
> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in the
> Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer channels a=
nd
> one 32-bit timer channel. It supports the following functions
>  - Counter
>  - Timer
>  - PWM
>=20
> This patch series aims to add core, counter and pwm driver for MTU3a. The
> core instantiates child devices using mfd api.
>=20
> The 8/16/32 bit registers are mixed in each channel. The HW specification=
s
> of the IP is described in patch#1.
>=20
> Current patch set is tested for PWM mode1 on MTU3 channel and 16 and 32 b=
it
> phase counting modes on MTU1 and MTU2 channels.
>=20
> There is a plan to add clock event driver later for Power management.
>=20
> Ref:
>=20
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221010145222=
.1047748-2-biju.das.jz@bp.renesas.com/=20

> v10->v11:
>  * Added Rb tag from William Breathitt Gray for the driver patch
>  * Replaced count2 channel name from "combined"->"cascaded", as channels
>    are cascaded
>  * Simplified the locking by adding the helper functions
>    rz_mtu3_lock_if_counter_is_valid, rz_mtu3_lock_if_count_is_enabled,
>    and rz_mtu3_lock_if_ch0_is_enabled.
>  * Added the MAINTAINERS entries for the driver.
> v9->v10:
>  * Added logs from PWM and counter
>  * Added Rb tag from William Breathitt Gray for sysfs counter doc
>  * Added helper function for rz_mtu3_count_{action,function}_read
>  * Added priv->lock in rz_mtu3_count_function_read and rz_mtu3_count_
>    direction_read.
>  * Added ch->is_busy check for rz_mtu3_action_read()
>  * Added rz_mtu3_is_ch0_enabled() for device specific sysfs variables.
>  * Added ch->is_busy check for device specific sysfs variables.
> v8->v9:
>  * Added prescale/duty_cycle variables to struct rz_mtu3_pwm_chip and
>    cached this values in rz_mtu3_pwm_config and used this cached values
>    in get_state(), if PWM is disabled.
>  * Added return code for get_state().
>  * Added available blocks for external_input_phase_clock_select_available
>  * Removed the "This attribute" from the external_input_phase_clock_selec=
t
>    description, and capitalize the word "counter" from description.
>  * Removed the "This attribute" from the cascade_counts_enable descriptio=
n,
>    and capitalize "counts" and "counter"
>  * Moved these device-level configuration blocks to top of the file.
>  * Added count_is_enabled variable to struct rz_mtu3_cnt
>  * Added check for ch->is_busy and count_is_enabled before every Counter
>    callback to ensure we do not try to access a busy channel used by othe=
r
>    subsystem(eg: pwm).
>  * Removed id parameter from rz_mtu3_32bit_cnt_setting()
>  * Made definition of rz_mtu3_get_ch() in single line.
>  * Replaced break->return in rz_mtu3_32bit_cnt_setting(),
>    rz_mtu3_count_function_read() and rz_mtu3_initialize_counter()
>    and removed redundant return 0.
>  * Simplified synapse signal check for rz_mtu3_action_read().
> v7->v8:
>  * Add locking for RMW on rz_mtu3_shared_reg_update_bit()
>  * Replaced enum rz_mtu3_functions with channel busy flag
>  * Added API for request and release a channel.
>  * Replaced cascade_enable->cascade_counts_enable
>  * Updated commit header and description
>  * Added external_input_phase_clock_select_available entry for driver-
>    specific enum attribute and created a new entry block for it.
>  * Add a line stating cascade_counts_enable is a boolean attribute.
>  * Added missing 'component_id' suffix.
>  * Simplified rz_mtu3_initialize_counter by calling rz_mtu3_request_
>    channel() and release the acquired sibling channel in case of error.
>  * Simplified rz_mtu3_terminate_counter by calling rz_mtu3_release_
>    channel().
>  * Removed unused ceiling and ch_id from rz_mtu3_count_write()
>  * Replaced the error -EINVAL->-EBUSY for rz_mtu3_is_counter_invalid()
>  * Avoided race between rz_mtu3_count_{read, write} with rz_mtu3_
>    cascade_counts_enable_set() by adding locks and moved the lock
>    before rz_mtu3_is_counter_invalid()
>  * Protected the rz_mtu3_count_ceiling_read() function with a lock
>    to make sure the cascade operation mode doesn't not change and
>    that the priv data structure accesses don't race when they are
>    changed in the ceiling_write() callback.
>  * Added lock in rz_mtu3_cascade_enable_set() to make sure the other
>    callbacks don't try to read the LWA state while updating LWA.
>  * Added lock in rz_mtu3_ext_input_phase_clock_select_set() to ensure
>    the other callbacks don't try to read the PHCKSEL state while updating
>    PHCKSEL.
>  * Added lock to avoid race between rz_mtu3_count_function_write() and
>    rz_mtu3_action_read()
>  * Updated rz_mtu3_action_read to return 0, if Synapse is in COUNTER_SYNA=
PSE
>    _ACTION_NONE state.
>  * Replaced sysfs variable cascade_enable->cascade_counts_enable
>  * Renamed rz_mtu3_cascade_enable_get->rz_mtu3_cascade_counts_enable_get
>  * Renamed rz_mtu3_cascade_enable_set->rz_mtu3_cascade_counts_enable_set
>  * Removed redundent ceiling assignment from rz_mtu3_count_ceiling_read()
>  * Removed unused ceiling and ch_id from rz_mtu3_count_write().
>  * Simplified rz_mtu3_pwm_request by calling rz_mtu3_request_channel()
>  * Simplified rz_mtu3_pwm_free by calling rz_mtu3_release_channel()
> v6->v7:
>  * Added channel specific mutex to avoid races between child devices
>    (for eg: pwm and counter).
>  * Added rz_mtu3_shared_reg_update_bit() to update bits.
>  * Replaced sysfs variable "long_word_access_ctrl_mode->cascade_enable"
>  * Updated Kernel version in sysfs Documentation
>  * Updated commit description for counter driver
>  * Added Register descriptions
>  * Opimized size of cache variable by using union
>  * Used test_bit() in rz_mtu3_is_counter_invalid()
>  * Replaced val->timer_mode in rz_mtu3_count_function_{read,write}
>  * Added TODO comment phase3 and phase5 modes.
>  * replaced if-else with ternary expression in
> rz_mtu3_count_direction_read()
>  * Used switch statement in rz_mtu3_count_ceiling_read to consistent with
> write
>  * Provided default case for all switch statements.
>  * Add mutex lock for avoiding races with other devices and counter
>  * Updated comments in rz_mtu3_action_read()
>  * Replaced COUNTER_COMP_DEVICE_BOOL->COUNTER_COMP_DEVICE_BOOL for
>    cascade_enable
>  * Replaced RZ_MTU3_GET_HW_CH->rz_mtu3_get_hw_ch
>  * Added rz_mtu3_get_ch() to get channels
>  * used rz_mtu3_shared_reg_update_bit for cascade_enable and
>    selecting phase input clock.
>  * Added rz_mtu3_is_counter_invalid() check in rz_mtu3_count_ceiling_read=
()
>  * Added channel specific mutex lock to avoid race between counter
>    device and rz_mtu3_pwm_{request,free}
>  * Added pm_runtime_resume_and_get in rz_mtu3_pwm_enable()
>  * Added pm_runtime_put_sync in rz_mtu3_pwm_disable()
>  * Updated rz_mtu3_pwm_config()
>  * Updated rz_mtu3_pwm_apply()
> v5->v6:
>  * Added Rb tag from Rob and Krzysztof for the binding patch.
>  * Updated commit and KConfig description for the driver patches
>  * Selected MFD_CORE to avoid build error if CONFIG_MFD_CORE not set.
>  * Improved error handling in core driver's probe().
>  * Fixed RZ_MTU3_GET_HW_CH Macro for argument reuse 'id' -
>    possible side-effects?
>  * Replaced SET_RUNTIME_PM_OPS->DEFINE_RUNTIME_DEV_PM_OPS and removed
>    __maybe_unused from suspend/resume()
>  * Replaced dev_get_drvdata from rz_mtu3_pwm_pm_disable()
>  * Sorted header files for all driver files.
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
> functionalities
>    that binds against "renesas,rz-mtu3".
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
>  * Removed "#address-cells" and "#size-cells" as it do not have children
> with
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
> Logs:
> root@smarc-rzg2l:/# /mtu_test.sh
> #### Zero duty cycle ###
> #### decrement Period ###
> #### Increment Period ###
> #### decrement duty cycle ###
> #### Increment duty cycle ###
> ### Unbind the PWM driver####
> ### Bind the PWM driver####
> Positive counting
> cascade_counts_enable is 0
> #### Ch0 count
> 0
> 2
> 8
> 13
> 18
> 23
> 28
> 33
> 38
> 44
> 50
> 3
> 9
> 14
> 19
> 24
> 29
> 35
> 39
> 45
> #### Ch1 count
> #### Select Phase clock
> Phase clock MTCLKA-MTCLKB
> 0
> 5
> 10
> 15
> 20
> 4
> 10
> 14
> 20
> 3
> 9
> 14
> 19
> 3
> 8
> 14
> 18
> 3
> 7
> 13
> #### Select Phase clock
> Phase clock MTCLKA-MTCLKB
> cascade_counts_enable is 1
> #### Ch2 count
> 0
> 5
> 10
> 15
> 21
> 25
> 31
> 36
> 41
> 46
> 51
> 56
> 61
> 67
> 71
> 77
> 82
> 87
> 92
> 97
> ### Unbind the counter driver####
> ### Bind the counter driver####
> ### Unbind the Core driver####
> ### Bind the Core driver####
> Read at address  0x11010538 (0xffffb1aaa538): 0x00000000 root@smarc-rzg2l=
:/#
>=20
> Biju Das (6):
>   dt-bindings: timer: Document RZ/G2L MTU3a bindings
>   clocksource/drivers: Add Renesas RZ/G2L MTU3a core driver
>   Documentation: ABI: sysfs-bus-counter: add cascade_counts_enable and
>     external_input_phase_clock_select
>   counter: Add Renesas RZ/G2L MTU3a counter driver
>   MAINTAINERS: Add entries for Renesas RZ/G2L MTU3a counter driver
>   pwm: Add Renesas RZ/G2L MTU3a PWM driver
>=20
>  Documentation/ABI/testing/sysfs-bus-counter   |  32 +
>  .../bindings/timer/renesas,rz-mtu3.yaml       | 302 ++++++
>  MAINTAINERS                                   |   8 +
>  drivers/clocksource/Kconfig                   |  11 +
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/rz-mtu3.c                 | 459 +++++++++
>  drivers/counter/Kconfig                       |  11 +
>  drivers/counter/Makefile                      |   1 +
>  drivers/counter/rz-mtu3-cnt.c                 | 903 ++++++++++++++++++
>  drivers/pwm/Kconfig                           |  11 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-rz-mtu3.c                     | 486 ++++++++++
>  include/clocksource/rz-mtu3.h                 | 237 +++++
>  13 files changed, 2463 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,rz-
> mtu3.yaml
>  create mode 100644 drivers/clocksource/rz-mtu3.c  create mode 100644
> drivers/counter/rz-mtu3-cnt.c  create mode 100644 drivers/pwm/pwm-rz-mtu3=
.c
> create mode 100644 include/clocksource/rz-mtu3.h
>=20
> --
> 2.25.1

