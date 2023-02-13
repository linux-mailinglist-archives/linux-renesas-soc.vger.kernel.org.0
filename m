Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE36B6947F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 15:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjBMO1C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 09:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjBMO1B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 09:27:01 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2119.outbound.protection.outlook.com [40.107.117.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C53916AEC;
        Mon, 13 Feb 2023 06:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3xbITAE9ST95nEZMgPxaLM2GgIz7SPArbtLNdApzAV15F92rxPYZnlyLxwwOiaVTHose7A/poPYg7oP+VJr8HEaJaZIdo59X/GdbCgJREhQq/DN/SrHGfnCQvCfCMseMwWkF03qsfbTbdBpEnQ6WPRcU1CQGTUct8EykrlffgiOyG7MUayGYVtap75mLjx5qyQTWT+Xrgm/G6dRnDtOnUoU4/9qywxQOvyNDESNAvAQ7B5U0PyiBKekkhzagW70zOtjlBqIVGo4/GF8E+E+lGcRmUhjoFyW1rZY0F8Kb8PXqeFZ9jcVxuQpDtkUvqlB6JuriTr1re093mSE31Q6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUcux0oSruy9ZCPufAJ1JXHEVWxTwrhAibL3p8vT4+g=;
 b=EiwtY82LqwCxrjRlStAwkCgnyHdQU6hy3svyj7Z3RIWzmrYIRQLFt3pjeiym6vhaGvbsBVv0QZcqzaIsg5+AF80oYj+mJSJDkOd/MO2FBNKOxMe5hnSR6KW8HVbNApAfU2Rwd+Ym28RgIuxZ6hcDWckm4eyPvxvSOilVWuH9eEU3adUDEPPQ8q0AF6nX+tGbXlGRy51DHIXtvnTlncsn0O//G910zubuEui0M4T7CiPXW0mymjgon+qUZqXJyHWn6HTGxFmDUbXf/jhETcjdPhwrXC9TmQbc7KTmn4rYbGqitDQ6alzdO+GZPkd98FtA51rrTSnuG7IRiabS9a5AaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUcux0oSruy9ZCPufAJ1JXHEVWxTwrhAibL3p8vT4+g=;
 b=w4DnFKZCrjrVW4r+vOmxavO/oh4lS8SXv1WjZP0cKhL/Y+6T+V9/EYNt+uxUeUC+PIe0cAzY6Rh0l2AdtauPezZW0XsuBfu7/7G1/LrjGSVaxz06AsOu10OZk7evM88IUtY5cUp1vXN6/9L5VW+Wqu0NDnJwTjCneobVwUpfBMg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8681.jpnprd01.prod.outlook.com (2603:1096:604:17d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:26:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 14:26:54 +0000
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
Thread-Index: AQHZPY8kj9QN2R7bt0udUTepz/GAba7Mkw8AgAAAZ9CAAAeJgIAAAGyAgAAAnACAAAB4EIAAC5aAgAAAy7CAAAghgIAAKhlAgAATa4CAAAECwA==
Date:   Mon, 13 Feb 2023 14:26:54 +0000
Message-ID: <OS0PR01MB5922B076ED246A7BAC7A339E86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
 <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+oJkcP2e5a9H7fr@oden.dyn.berto.se>
 <OS0PR01MB5922EFD04CDA5EE790CE2B0086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+oRDb8DzgUhu6U6@oden.dyn.berto.se>
 <OS0PR01MB592203B32464BE32BC55562886DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+pEpwa3vFEh58Zc@oden.dyn.berto.se>
In-Reply-To: <Y+pEpwa3vFEh58Zc@oden.dyn.berto.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8681:EE_
x-ms-office365-filtering-correlation-id: 2ff38360-b345-4a95-8578-08db0dce5b1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6jWtARACQy14iuv0bZf7uJBiL11UoynAFTSuXG0RK77yQGTIQzoh2FRWiqMRx6WQ/6d8fT3GZmPhUYx8+GlG41iHTu6PVk6YK38tmYu/VjXQDju98puumxHIteHwIavBE8FAQLjUmP4wGceP0FSqdMr0AbMpXz4rFjiGzti4jUXjhlAcq4vxgPx/JWS5cJ4SSagDK2qzIAYk5xkFe4JwyVbFqFtRbudGd1as0zX2xR9xAD3gUovqw8evhGs1PwQdDKCZKWoC0zrlmaE7z31N4gl/+Y/64cEImbskk7pxE1xp64zVYGgPFJ3y/AKqJgffbvtN6vt1omGj0Jvx6iD7KPqbAkcc5mxKRD4kPO9oAWapDTWlSf6W98AagLqlcF1pXYLowPEVmALEqqCXLnw/3Z8iscV5UWsv1+PtO6QPYJDcWaPhDgkonKW1zBaMthT6wsEu2x5Y8glutekNwoDnV+ozfWv7rKxNsxMZvZ3ZAd3ZoxgWZS1HeShOv6eSzXY07Ysy7tREjHSs8NRhP9PuFdF13zOij7dWFyjBlMDvrWyB9Vwmi9TPCgsaE8n+PI0zz0B01TgzTkuJyzxldLrIejRGq6WWdm2K+9wWlfQvrqtSvWiuc1kYQA5dOnIxZXh+jQKbkWnD2TSOJF8YVzGXzxUhzYVFd83gjhA9l4ONNR3O+xhUTntxcNdQyVE87NKgIjxpngCStZzYvWXcHMD65w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199018)(33656002)(38100700002)(86362001)(38070700005)(55016003)(122000001)(64756008)(6916009)(52536014)(4326008)(66556008)(66946007)(66476007)(66446008)(76116006)(41300700001)(54906003)(8676002)(316002)(8936002)(5660300002)(30864003)(2906002)(83380400001)(66574015)(71200400001)(53546011)(26005)(9686003)(6506007)(7696005)(186003)(478600001)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/f0AY4A6PQlPfB2ro2pDWhCODxnNrGn7WpGBbAeDq+U0gtGp5/9bytFAeh?=
 =?iso-8859-1?Q?Lt/0D7GoS34SPkEPos/58SkDDajw1itzr3ERZW4kqIw6nmoi0VFVbMqLRx?=
 =?iso-8859-1?Q?RuNjuPi7rQe3GtzQQcnEOE6O7McM5NPKlz6tQ1umJshiTxXmg3Q3yA8Zl0?=
 =?iso-8859-1?Q?xWQphvIIoRuPUoQRgOThlNbHyheb1UrZmGO5wx+IL10VkpEAaQwVL10Xi+?=
 =?iso-8859-1?Q?aGjDm3iNr+sL8SvfWdTjLbj8QE7vR1Uc74yTl9nJEWKupbZ9I+bjc/mAZN?=
 =?iso-8859-1?Q?iXLM7dHv+AG7JuBQJSQptoNHuqhR+xVHK+q1HoHO/ijpf2i46lwlaVoAKG?=
 =?iso-8859-1?Q?FI34O8XbklvnV+xpLl9QouC/F6DWyIT1RPHwPxvbg3EvVKaxxOXu3JD8n4?=
 =?iso-8859-1?Q?25cIdgqFfbs5DBbpXayd9kznWet9HiASq3/Ev11CtPBKFu7L3UrrbYLgyn?=
 =?iso-8859-1?Q?xsL4dQE4DSATX7V076P7fkhUrXaai/4PP7EKJT/1QneVdi4JFLLPAl6oD3?=
 =?iso-8859-1?Q?gcv/m3m0PP3/EBze+UUNGmN5JDy76LZ0zC4Ill5nyN74TVHCq0JCdOA1Vm?=
 =?iso-8859-1?Q?TJ6B3ThUEe+s9q5VINjCHVeFkj/MFSqTQC5Zfz9SkOat5A/BTHVSgesj9R?=
 =?iso-8859-1?Q?36naNAy6mKuhwNjYm2SWDk8poiz5JuGYJ7ljxDM0OqF69euFEtVxaS0ekJ?=
 =?iso-8859-1?Q?0AAi0ksKVUaQnu32q6bi0UhOrVtPsQpODrgbKP0+rhiL2sr7hwF9Uq9kWz?=
 =?iso-8859-1?Q?7gnThbS9zG3IWVqNnU7MrgMCfKtHGdWvo6/E6zOoUZ/8xzOjiyoq0fEN3x?=
 =?iso-8859-1?Q?jfprKsiTN0ACsdVMUJrVVvGQYuA01eoTOo/bAVj+vvygIUHcBib4TRZSSg?=
 =?iso-8859-1?Q?kSAGC6ehkJhBpuk9TQPJaTE7ukU1+8q/0aFdIa3QsRLKxX6sNaa1hORWuR?=
 =?iso-8859-1?Q?f2yJ83YSFch979ht39591YEWltWJScYgzQNPAw24MtsZka/iMS5HcHx+TB?=
 =?iso-8859-1?Q?SkwHtYWoHwjDKNRC5jOdG/xfEThWqLT9P69xjg4ToU8vIjW5WLtIJhfCyz?=
 =?iso-8859-1?Q?wUj459G8y3oVQklIAGjFgqlPUnJ2rR9DuciGEXRjmuhAesR1JotUnz7VDL?=
 =?iso-8859-1?Q?CCAgKD2wX+sewm7DidmLhbe8kWlgmi8WPkAymxN9nGjGPoGLf5AsEnKg3U?=
 =?iso-8859-1?Q?fTo0zqG1NQRD9hREvKgcT65muzZH0/JKaDwJ1kj8lbqWrf6yQsUNgCX8Za?=
 =?iso-8859-1?Q?4Ff3x6/FlM8O2mMrz+YaZggw0USd4OIOsZnMNOQehXCOvVHOexw3XILF7c?=
 =?iso-8859-1?Q?z1WEH2aTnIFbTO8PElgWyaR5qHeyazpCMIhrDUEBVNp8USeRsu8CXB3VM5?=
 =?iso-8859-1?Q?uvaVqVGRPGsC+EmafYJiye/oo1K5Iutxy0E6OQ5thd89PEUuPx84mW6MUB?=
 =?iso-8859-1?Q?cJW5xdsdlu3Jdncpk8o3xethwRyRpxhFbXInwWtlH8c+w3Tn5NMLUZasTi?=
 =?iso-8859-1?Q?J5orv1CjB202qZHvczDyeQXmdLBukgG0fGyTXPtlgR8PNdGBEdFRvRYdGm?=
 =?iso-8859-1?Q?OIX9URHpGQF9pzgwwymuOyqxABlHbb6OpMJFlW2f7riJFJdMU7Un+VaxeH?=
 =?iso-8859-1?Q?zynuDrTs2EmAv0qq2/VEugLx0+LmAXg09ADbHBNqPcaiXsRoggWgYBIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff38360-b345-4a95-8578-08db0dce5b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 14:26:54.5764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxVRJOLZr3GrruadBxJTcqSrsGw8aPbS95AK7JQehGjkgiIUDmfpbmIiJ5eGNP0dVpnOujCQk94TknoHY74U/0XaCDmoOBzDy2dkuRbNeXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8681
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thanks for the feedback.

> Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> serial8250_em_hw_info
>=20
> Hi Biju,
>=20
> On 2023-02-13 13:01:06 +0000, Biju Das wrote:
> > Please get files from here
> >
>=20
> Thanks for the branch.
>=20
> It boots and the serial console appears to be functioning as expected.
> Is there anything in particular you like me to test? I attach the full bo=
ot
> log in case it's useful for you.

Cool. It should be OK. Looks like RZ/V2M changes applies to EMMA mobile as =
well.

If you have cables, you could test {ttyS0, ttyS2, ttyS2} at {9600, 19200, 3=
8400, 57600, 115200} bps
If it supports flow control, check that as well.

Eg:
stty -F /dev/ttyS0 115200
stty -F /dev/ttyS0 115200 crtscts

Open a teraterm and do below read/write testing

cat /dev/ttyS0 --> for reading
echo test > /dev/ttyS0 --> for writing

or Write a serial test program for read/write test on above baud rates.

If the cable is not available, you could also verify register settings
To check whether it matches with EMMA hardware manual.


dump() {

devmem2 0xA4040000  | grep Read
devmem2 0xA4040004  | grep Read
devmem2 0xA4040008  | grep Read
devmem2 0xA404000C  | grep Read

devmem2 0xA4040010  | grep Read
devmem2 0xA4040014  | grep Read
devmem2 0xA4040018  | grep Read
devmem2 0xA404001C  | grep Read

devmem2 0xA4040020  | grep Read
devmem2 0xA4040024  | grep Read  # DLAB(LCR[7]) 0x1B
devmem2 0xA4040028  | grep Read  # DLAB(LCR[7]) 0x1B
devmem2 0xA404002C  | grep Read

devmem2 0xA4040030  | grep Read
devmem2 0xA4040034  | grep Read
}

dump

Cheers,
Biju




>=20
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.2.0-rc7-next-20230210-12179-g91bd68019b4b
> (neg@sleipner) (arm-linux-gnueabihf-gcc (GCC) 10.2.0, GNU ld (GNU Binutil=
s)
> 2.35.1) #2 SMP Mon Feb 13 15:02:12 CET 2023
> [    0.000000] CPU: ARMv7 Processor [411fc092] revision 2 (ARMv7),
> cr=3D10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
> [    0.000000] OF: fdt: Machine model: EMEV2 KZM9D Board
> [    0.000000] printk: debug: ignoring loglevel setting.
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] cma: Failed to reserve 128 MiB
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000040000000-0x0000000047ffffff]
> [    0.000000]   HighMem  empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x0000000047ffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-
> 0x0000000047ffffff]
> [    0.000000] percpu: Embedded 14 pages/cpu s33620 r0 d23724 u57344
> [    0.000000] pcpu-alloc: s33620 r0 d23724 u57344 alloc=3D14*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 325=
12
> [    0.000000] Kernel command line: ignore_loglevel rw root=3D/dev/nfs ip=
=3Don
> [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 byte=
s,
> linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 116068K/131072K available (8192K kernel code, 1150=
K
> rwdata, 2596K rodata, 1024K init, 251K bss, 15004K reserved, 0K cma-
> reserved, 0K highmem)
> [    0.000000] trace event string verifier disabled
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU event tracing is enabled.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to
> nr_cpu_ids=3D2.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is=
 10
> jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> [    0.000000] GIC: enabling workaround for broken byte access
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
> contention.
> [    0.000000] timer_probe: no matching timers found
> [    0.000000] Console: colour dummy device 80x30
> [    0.000000] printk: console [tty0] enabled
> [    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wra=
ps
> every 21474836475000000ns
> [    0.000000] Calibrating delay loop (skipped) preset value.. 1066.00
> BogoMIPS (lpj=3D5330000)
> [    0.000000] pid_max: default: 32768 minimum: 301
> [    0.000000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes=
,
> linear)
> [    0.000000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096
> bytes, linear)
> [    0.000000] CPU: Testing write buffer coherency: ok
> [    0.000000] CPU0: Spectre v2: using BPIALL workaround
> [    0.000000] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.000000] Setting up static identity map for 0x40100000 - 0x40100060
> [    0.000000] rcu: Hierarchical SRCU implementation.
> [    0.000000] rcu: 	Max phase no-delay instances is 1000.
> [    0.000000] smp: Bringing up secondary CPUs ...
> [    0.000000] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    0.000000] CPU1: Spectre v2: using BPIALL workaround
> [    0.000000] smp: Brought up 1 node, 2 CPUs
> [    0.000000] SMP: Total of 2 processors activated (2132.00 BogoMIPS).
> [    0.000000] CPU: All CPU(s) started in SVC mode.
> [    0.000000] devtmpfs: initialized
> [    0.000000] VFP support v0.3: implementor 41 architecture 3 part 30
> variant 9 rev 1
> [    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.000000] futex hash table entries: 512 (order: 3, 32768 bytes, line=
ar)
> [    0.000000] pinctrl core: initialized pinctrl subsystem
> [    0.000000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.000000] DMA: preallocated 256 KiB pool for atomic coherent
> allocations
> [    0.000000] thermal_sys: Registered thermal governor 'step_wise'
> [    0.000000] No ATAGs?
> [    0.000000] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1
> watchpoint registers.
> [    0.000000] hw-breakpoint: maximum watchpoint size is 4 bytes.
> [    0.000000] sh-pfc e0140200.pinctrl: emev2_pfc support registered
> [    0.000000] SCSI subsystem initialized
> [    0.000000] libata version 3.00 loaded.
> [    0.000000] usbcore: registered new interface driver usbfs
> [    0.000000] usbcore: registered new interface driver hub
> [    0.000000] usbcore: registered new device driver usb
> [    0.000000] mc: Linux media interface: v0.10
> [    0.000000] videodev: Linux video capture interface: v2.00
> [    0.000000] pps_core: LinuxPPS API ver. 1 registered
> [    0.000000] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o
> Giometti <giometti@linux.it>
> [    0.000000] PTP clock support registered
> [    0.000000] em_sti e0180000.timer: used for clock events
> [    0.000000] em_sti e0180000.timer: used for oneshot clock events
> [    0.000000] em_sti e0180000.timer: used as clock source
> [    0.000000] clocksource: e0180000.timer: mask: 0xffffffffffff max_cycl=
es:
> 0x1ef4687b1, max_idle_ns: 112843571739654 ns
> [    0.000000] Advanced Linux Sound Architecture Driver Initialized.
> [    0.000000] vgaarb: loaded
> [    0.890000] clocksource: Switched to clocksource e0180000.timer
> [    0.900000] Clockevents: could not switch to one-shot mode:
> [    0.900000] Clockevents: could not switch to one-shot mode: dummy_time=
r
> is not functional.
> [    0.900000]  dummy_timer is not functional.
> [    0.910000] NET: Registered PF_INET protocol family
> [    0.910000] IP idents hash table entries: 2048 (order: 2, 16384 bytes,
> linear)
> [    0.910000] tcp_listen_portaddr_hash hash table entries: 512 (order: 0=
,
> 4096 bytes, linear)
> [    0.910000] Table-perturb hash table entries: 65536 (order: 6, 262144
> bytes, linear)
> [    0.910000] TCP established hash table entries: 1024 (order: 0, 4096
> bytes, linear)
> [    0.910000] TCP bind hash table entries: 1024 (order: 2, 16384 bytes,
> linear)
> [    0.910000] TCP: Hash tables configured (established 1024 bind 1024)
> [    0.910000] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
> [    0.910000] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes,
> linear)
> [    0.910000] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.910000] RPC: Registered named UNIX socket transport module.
> [    0.910000] RPC: Registered udp transport module.
> [    0.910000] RPC: Registered tcp transport module.
> [    0.910000] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.910000] PCI: CLS 0 bytes, default 64
> [    0.950000] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7
> counters available
> [    0.950000] workingset: timestamp_bits=3D30 max_order=3D15 bucket_orde=
r=3D0
> [    0.950000] NFS: Registering the id_resolver key type
> [    0.950000] Key type id_resolver registered
> [    0.950000] Key type id_legacy registered
> [    0.950000] nfs4filelayout_init: NFSv4 File Layout Driver Registering.=
..
> [    0.950000] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> Registering...
> [    0.960000] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 246)
> [    0.960000] io scheduler mq-deadline registered
> [    0.960000] io scheduler kyber registered
> [    0.960000] io scheduler bfq registered
> [    0.970000] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    0.970000] e1020000.serial: ttyS0 at MMIO 0xe1020000 (irq =3D 37,
> base_baud =3D 796444) is a TI16750
> [    0.970000] e1030000.serial: ttyS1 at MMIO 0xe1030000 (irq =3D 38,
> base_baud =3D 7168000) is a TI16750
> [    0.970000] printk: console [ttyS1] enabled
> [    1.660000] e1040000.serial: ttyS2 at MMIO 0xe1040000 (irq =3D 39,
> base_baud =3D 14336000) is a TI16750
> [    1.670000] e1050000.serial: ttyS3 at MMIO 0xe1050000 (irq =3D 40,
> base_baud =3D 2389333) is a TI16750
> [    1.680000] SuperH (H)SCI(F) driver initialized
> [    1.700000] CAN device driver interface
> [    1.760000] smsc911x 20000000.ethernet eth0: MAC Address:
> 00:0a:a3:02:12:92
> [    1.770000] UDC core: g_ether: couldn't find an available UDC
> [    1.770000] i2c_dev: i2c /dev entries driver
> [    1.780000] em-i2c e0070000.i2c: Added i2c controller 0, irq 42
> [    1.790000] em-i2c e10a0000.i2c: Added i2c controller 1, irq 43
> [    1.800000] cpu cpu0: OPP table can't be empty
> [    1.800000] usbcore: registered new interface driver usbhid
> [    1.810000] usbhid: USB HID core driver
> [    1.820000] NET: Registered PF_INET6 protocol family
> [    1.820000] Segment Routing with IPv6
> [    1.830000] In-situ OAM (IOAM) with IPv6
> [    1.830000] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    1.840000] NET: Registered PF_PACKET protocol family
> [    1.840000] can: controller area network core
> [    1.850000] NET: Registered PF_CAN protocol family
> [    1.850000] can: raw protocol
> [    1.860000] can: broadcast manager protocol
> [    1.860000] can: netlink gateway - max_hops=3D1
> [    1.870000] Key type dns_resolver registered
> [    1.870000] Registering SWP/SWPB emulation handler
> [    1.900000] input: gpio_keys as /devices/platform/gpio_keys/input/inpu=
t0
> [    1.960000] SMSC LAN8700 20000000.ethernet-ffffffff:01: attached PHY
> driver (mii_bus:phy_addr=3D20000000.ethernet-ffffffff:01, irq=3DPOLL)
> [    2.000000] smsc911x 20000000.ethernet eth0: SMSC911x/921x identified =
at
> 0xc8920000, IRQ: 41
> [    4.080000] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> [    4.130000] Sending DHCP requests ., OK
> [    4.170000] IP-Config: Got DHCP answer from 10.0.1.1, my address is
> 10.0.1.2
> [    4.180000] IP-Config: Complete:
> [    4.180000]      device=3Deth0, hwaddr=3D00:0a:a3:02:12:92, ipaddr=3D1=
0.0.1.2,
> mask=3D255.255.255.0, gw=3D10.0.1.1
> [    4.190000]      host=3D10.0.1.2, domain=3Ddyn.berto.se, nis-domain=3D=
(none)
> [    4.200000]      bootserver=3D10.0.1.1, rootserver=3D10.0.1.1,
> rootpath=3D/srv/nfs4/arch,tcp,v3
> [    4.200000]      nameserver0=3D192.168.20.1
> [    4.210000] ALSA device list:
> [    4.210000]   No soundcards found.
> [    4.240000] VFS: Mounted root (nfs filesystem) on device 0:15.
> [    4.240000] devtmpfs: mounted
> [    4.250000] Freeing unused kernel image (initmem) memory: 1024K
> [    4.290000] Run /sbin/init as init process
> [    4.290000]   with arguments:
> [    4.290000]     /sbin/init
> [    4.300000]   with environment:
> [    4.300000]     HOME=3D/
> [    4.300000]     TERM=3Dlinux
> [    5.980000] systemd[1]: System time before build time, advancing clock=
.
> [    6.030000] systemd[1]: Failed to find module 'autofs4'
> [    6.160000] systemd[1]: systemd 252.5-1-arch running in system mode (+=
PAM
> +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +=
ACL
> +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP
> +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB
> +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT default-hierarchy=3Dunifi=
ed)
> [    6.190000] systemd[1]: Detected architecture arm.
> [    6.260000] systemd[1]: Hostname set to <arm>.
> [    6.510000] systemd[1]: bpf-lsm: BPF LSM hook not enabled in the kerne=
l,
> BPF LSM not supported
> [    6.520000] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=
=3D1
> 'systemd'
> [    8.810000] systemd[1]: Queued start job for default target Graphical
> Interface.
> [    8.830000] systemd[1]: Created slice Slice /system/getty.
> [    8.870000] systemd[1]: Created slice Slice /system/modprobe.
> [    8.910000] systemd[1]: Created slice Slice /system/serial-getty.
> [    8.950000] systemd[1]: Created slice User and Session Slice.
> [    8.990000] systemd[1]: Started Dispatch Password Requests to Console
> Directory Watch.
> [    9.030000] systemd[1]: Started Forward Password Requests to Wall
> Directory Watch.
> [    9.070000] systemd[1]: Arbitrary Executable File Formats File System
> Automount Point was skipped because of an unmet condition check
> (ConditionPathExists=3D/proc/sys/fs/binfmt_misc).
> [    9.080000] systemd[1]: Reached target Local Encrypted Volumes.
> [    9.120000] systemd[1]: Reached target Local Integrity Protected Volum=
es.
> [    9.160000] systemd[1]: Reached target Network is Online.
> [    9.200000] systemd[1]: Reached target Path Units.
> [    9.240000] systemd[1]: Reached target Slice Units.
> [    9.280000] systemd[1]: Reached target Swaps.
> [    9.320000] systemd[1]: Reached target Local Verity Protected Volumes.
> [    9.360000] systemd[1]: Listening on Device-mapper event daemon FIFOs.
> [    9.420000] systemd[1]: Listening on Process Core Dump Socket.
> [    9.460000] systemd[1]: Journal Audit Socket was skipped because of an
> unmet condition check (ConditionSecurity=3Daudit).
> [    9.470000] systemd[1]: Listening on Journal Socket (/dev/log).
> [    9.510000] systemd[1]: Listening on Journal Socket.
> [    9.550000] systemd[1]: Listening on udev Control Socket.
> [    9.590000] systemd[1]: Listening on udev Kernel Socket.
> [    9.630000] systemd[1]: Huge Pages File System was skipped because of =
an
> unmet condition check (ConditionPathExists=3D/sys/kernel/mm/hugepages).
> [    9.640000] systemd[1]: POSIX Message Queue File System was skipped
> because of an unmet condition check
> (ConditionPathExists=3D/proc/sys/fs/mqueue).
> [    9.710000] systemd[1]: Mounting /root/shared...
> [    9.750000] systemd[1]: Mounting Kernel Debug File System...
> [    9.790000] systemd[1]: Mounting Kernel Trace File System...
> [    9.850000] systemd[1]: Mounting Temporary Directory /tmp...
> [    9.900000] systemd[1]: Create List of Static Device Nodes was skipped
> because of an unmet condition check
> (ConditionFileNotEmpty=3D/lib/modules/6.2.0-rc7-next-20230210-12179-
> g91bd68019b4b/modules.devname).
> [    9.960000] systemd[1]: Starting Load Kernel Module configfs...
> [    9.990000] systemd[1]: Starting Load Kernel Module drm...
> [   10.040000] systemd[1]: Starting Load Kernel Module fuse...
> [   10.120000] systemd[1]: Load Kernel Modules was skipped because no
> trigger condition checks were met.
> [   10.210000] systemd[1]: Starting Remount Root and Kernel File Systems.=
..
> [   10.250000] systemd[1]: Repartition Root Disk was skipped because no
> trigger condition checks were met.
> [   10.270000] systemd[1]: Starting Apply Kernel Variables...
> [   10.360000] systemd[1]: Starting Coldplug All udev Devices...
> [   10.440000] systemd[1]: Mounted Kernel Debug File System.
> [   10.480000] systemd[1]: Mounted Kernel Trace File System.
> [   10.510000] systemd[1]: Mounted Temporary Directory /tmp.
> [   10.560000] systemd[1]: modprobe@configfs.service: Deactivated
> successfully.
> [   10.570000] systemd[1]: Finished Load Kernel Module configfs.
> [   10.640000] systemd[1]: modprobe@drm.service: Deactivated successfully=
.
> [   10.660000] systemd[1]: Finished Load Kernel Module drm.
> [   10.680000] systemd[1]: modprobe@fuse.service: Deactivated successfull=
y.
> [   10.690000] systemd[1]: Finished Load Kernel Module fuse.
> [   10.730000] systemd[1]: Finished Remount Root and Kernel File Systems.
> [   10.770000] systemd[1]: Finished Apply Kernel Variables.
> [   10.810000] systemd[1]: FUSE Control File System was skipped because o=
f
> an unmet condition check (ConditionPathExists=3D/sys/fs/fuse/connections)=
.
> [   10.880000] systemd[1]: Mounting Kernel Configuration File System...
> [   10.920000] systemd[1]: First Boot Wizard was skipped because of an un=
met
> condition check (ConditionFirstBoot=3Dyes).
> [   10.930000] systemd[1]: Rebuild Hardware Database was skipped because =
of
> an unmet condition check (ConditionNeedsUpdate=3D/etc).
> [   10.980000] systemd[1]: Starting Load/Save Random Seed...
> [   11.010000] systemd[1]: Create System Users was skipped because no
> trigger condition checks were met.
> [   11.030000] systemd[1]: Starting Create Static Device Nodes in /dev...
> [   11.100000] systemd[1]: Mounted Kernel Configuration File System.
> [   11.500000] systemd[1]: Reached target Host and Network Name Lookups.
> [   11.540000] systemd[1]: Listening on RPCbind Server Activation Socket.
> [   11.580000] systemd[1]: Reached target RPC Port Mapper.
> [   11.650000] systemd[1]: Starting NFS status monitor for NFSv2/3
> locking....
> [   11.830000] systemd[1]: Finished Coldplug All udev Devices.
> [   11.930000] systemd[1]: Starting RPC Bind...
> [   12.270000] systemd[1]: Finished Create Static Device Nodes in /dev.
> [   12.310000] systemd[1]: Reached target Preparation for Local File
> Systems.
> [   12.350000] systemd[1]: Virtual Machine and Container Storage
> (Compatibility) was skipped because of an unmet condition check
> (ConditionPathExists=3D/var/lib/machines.raw).
> [   12.370000] systemd[1]: Reached target Local File Systems.
> [   12.410000] systemd[1]: Entropy Daemon based on the HAVEGE algorithm w=
as
> skipped because of an unmet condition check (ConditionKernelVersion=3D<5.=
6).
> [   12.430000] systemd[1]: Rebuild Dynamic Linker Cache was skipped becau=
se
> no trigger condition checks were met.
> [   12.490000] systemd[1]: Starting Notify NFS peers of a restart...
> [   12.540000] systemd[1]: Set Up Additional Binary Formats was skipped
> because no trigger condition checks were met.
> [   12.550000] systemd[1]: systemd-journald.service: unit configures an I=
P
> firewall, but the local system does not support BPF/cgroup firewalling.
> [   12.570000] systemd[1]: (This warning is only shown for the first unit
> using IP firewalling.)
> [   12.620000] systemd[1]: Starting Journal Service...
> [   12.690000] systemd[1]: Starting Rule-based Manager for Device Events =
and
> Files...
> [   12.750000] systemd[1]: Started RPC Bind.
> [   12.800000] systemd[1]: Started Notify NFS peers of a restart.
> [   12.870000] systemd[1]: Started NFS status monitor for NFSv2/3 locking=
..
> [   13.180000] systemd[1]: Started Journal Service.
> [   17.010000] systemd-journald[86]: Received client request to flush
> runtime journal.
> [   21.390000] random: dbus-daemon: uninitialized urandom read (12 bytes
> read)
> [   22.200000] random: dbus-daemon: uninitialized urandom read (12 bytes
> read)
> [   51.370000] random: crng init done
>=20
> --
> Kind Regards,
> Niklas S=F6derlund
