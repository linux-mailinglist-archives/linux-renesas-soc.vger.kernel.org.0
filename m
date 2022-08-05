Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27C8458AB53
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Aug 2022 15:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbiHENJn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Aug 2022 09:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiHENJm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Aug 2022 09:09:42 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27581A812
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Aug 2022 06:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTaqI67SApwzJPS/PEdWm1uBHAg5GrrOXkXEStsOa3BynU14WRVPy9PQ/7WczeVpVAGsA/05PJXJgDtYSEjD1wlJYjFKfjIyLhGlaTDh8FJr4YxODbOaR+jLPyLBV8o5P7SFeUIWQtnj8tF5qznTu6acFK2YryyAGKNZrqAvWjIxVuzIB/7BiyCgUfKkOkUoKUWQtTAoiJXQVUWsGnXjy2QnwBD4oxZhKPoGucb3OvLtnbZlF4kNuifjy6EyDWa7z9GQIMsl/9GaOQ7YfselgQEo+TwfyUY5fijLDpfoVCsPnUvHN4UgHCwzBGo6t/3q79FT9X0TGxmJ2gsuCTRlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q4Or+xmxzHK9Swf1nzCGfBNjULlV/jQPNcbfFjvJdA=;
 b=l5a2zgNBddhNp0xP3NjGdLP0k3eIvNUM0aK2fBcLWAvUy5exxfrmfVSQq+m8mkVjxX6d67yRdky/EzNklY9Qvo8q6SKrwcLoF2a0KvA9y4m7CJww6si/sz4FM4Mag5+KEtRMPPo91kdYf9NvzB8ZoW/Ax0gx1hX4ceyGNtopujp5cUPzbTH1oJnG+UzNm8V85v9Ec0KTHEkFd3LZL+CFPFX7Y8d1waellUtKrUFzxUHotH66EjryhAU+UH6M5163BZjKqEdIaHiNqzNKe2RacXBGYusUf5PHzEUr6xAczPSabIZ8R4tldbWIdKNwXxsF7PVjVESh1/mGl7W60qEMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q4Or+xmxzHK9Swf1nzCGfBNjULlV/jQPNcbfFjvJdA=;
 b=dQq9K2aTgPjvL4vVEd2fSwQ9CAO2KJrvWKJr6EB1AnpdTig9G/oydwgVMCVmC9c93yyUAmXuSHmtWnyhuoyt9Bs0amThAdi/oXczBoWq6xF//FzucdsDLNudSYclYUcMwh0BIeIVehaW8yu2OX3t27ybcU7Jt+MmfZ5qNIOhFLw=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS3PR01MB9515.jpnprd01.prod.outlook.com (2603:1096:604:1c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 13:09:36 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 13:09:36 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RZ/V2M USB
Thread-Topic: RZ/V2M USB
Thread-Index: AdioxJFO3fqPouQQR2WlJ+Xylqw1MQ==
Date:   Fri, 5 Aug 2022 13:09:36 +0000
Message-ID: <TYYPR01MB70863A585C9F2B2B4ECE85D3F59E9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 849daf46-9769-49ce-7ddd-08da76e3bf20
x-ms-traffictypediagnostic: OS3PR01MB9515:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qtzXCwQRl6/gn5bUyRNY/BdtMDnyVe5YqqKtBv8KFW6N3VmlhN4EbUf2iOEynKHT2I53fW5FsseZeuoCXjxsvQ1s7fdoHyU+77Y4JU4YLpoZ3+ZpxKGK2uw7YusIZBy3KWTfNzB8D1IiEileA0kIjRiGRIRb/IyhTxni8ysOkddMMriiVdtTJyBFf85vpv2w0nsQvdCHIz/FJGE/OO6CxzMHUDLwAOWWZd3a3L2gY+pMGfBcSVCWObE/d5beBYREg0EnpKT64QtJ6L1WFz86d+2rjZ9dCGnXMuqctRSX1Yuyb4fjy4CuxN4bd2UvD24C5T7BIDDSzM96ypvUPDCXmTz9WVAebBAVpzzmTmKxqc/7BWsj7GTaWz1zKhavp2ipcS0vgkNJDH2YXeZe9p9MwszV4qCmYSSVDwnZSimGEXoOurWnuhh2+u3YfwgVH+68/4faU92jUMYcWzX/hqlxtQW9Mz4Hj+teQjWcFl86onzQaMO07+6v2SsG4Crpy403h+dBoQxKF+Rq7nED4WOrMSydx7v+pHt3MEcpAiJhENEJmwXHB1CWN7MhmA7YDUgUJI3Il9C5UN6ydk9vk2+EVeVJiT5XEGrO4Btjpc90bQeJFGa8x/2a2iYYTc32Wz+tlXgS+FgNCETlvX5UzIGFAww3EKXAe9ZVYZnCzjc2X1xOEqS5WlnL6JmhToe5k96UQVh/ieD3hV3Jj/1naBeAW7504VIgy8+2HLeNzudkfxMfnXKVFQOj52rG/cpDW7bAllmp1KEndQpyDfM4k0mWsruyt6vSVQ8/1d7D8YdOzd4xXeYVXLZ5U3L+feVdFbpJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(2906002)(110136005)(54906003)(55016003)(9686003)(316002)(71200400001)(38100700002)(122000001)(86362001)(83380400001)(7696005)(66946007)(8936002)(6506007)(64756008)(8676002)(66446008)(4326008)(76116006)(66556008)(52536014)(186003)(44832011)(33656002)(41300700001)(38070700005)(478600001)(5660300002)(107886003)(26005)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KljtFsYQ/wqjhS5Dj71oRVcXmw17t6F4063Btef8srk9YUqnSp31CKxvbGKW?=
 =?us-ascii?Q?N8lPX2nX4kHuPB7JDMJ1hnX6WXWRSvixYr7go18o82X6WkBM9GrxX2XzCApD?=
 =?us-ascii?Q?jK1yO9AC8N2pBLTTaSNQ5VThTDUI4bA8XInI6zDwvf/7Zqowvn4yYJEjiESN?=
 =?us-ascii?Q?JPuNQZRs4Yl7PVd0uly3fiTJsB5eKKtDUWbwPB4wMqpod2lf6KbTEfL7Yvnn?=
 =?us-ascii?Q?8yee8CMB+HaLd4MyED/PJl2p5ixn66deMVMxYj5RYILjlWN3v0wxo4mv7oTd?=
 =?us-ascii?Q?bkDrRQ0J+ZkKRguIyHAE/hsye5/jULZmPRbOy2WsCkfcIucHJzbmEKoKT8n7?=
 =?us-ascii?Q?wLRf4S2cue4gvhv5dxHp1uTBrEPOt6C+5l1FhySm/yxN2EMO/2I5Dbc4EnPm?=
 =?us-ascii?Q?AhMBO1HaQTEsArPSqaVjgJ6O+7skkeXbozj24YhwbkYvss6uKqNgpOEY05u7?=
 =?us-ascii?Q?n8doj1c/q/imfUOj4U58QheIv3hlLPA9L3cVzkTuSKHG47svjYx00n/bFgj3?=
 =?us-ascii?Q?J6q7rptDVYZx9mgDduxXKQd4eVYFdYIw6TGs6m6KUkROjo9UdK7CMZAzi0cZ?=
 =?us-ascii?Q?8+ihKsIN4PVM7nsxiky+s9ZvRzPCj62OqeNcFKbpxWhU/Iieu91xB7FQXhaA?=
 =?us-ascii?Q?VZ8WQTwrSmafMqozMWpdKzJThYHIucpMZT7DBaDZ33vbD8XbS2wgkmBB5Se1?=
 =?us-ascii?Q?z9FGkTs90JJs/F33QWzC5lLBT7A/SK6f4QjbnAd3WYAASCIB/6H+YXyi40iY?=
 =?us-ascii?Q?Fb3/Xh1Nn9D1T5SRpjhi/8+4OM+6xe4+ZMUy2+hfzY02KGUbDjD7U/wK1dJz?=
 =?us-ascii?Q?54qXStfP64sRNpPjt+/bDj+ZZRQXuDWIYIAXILQjoAo58unt6tWz1TkZGwZt?=
 =?us-ascii?Q?SgeK2nNXrT/EO0hkZI1W3lU8zIUcMV8Fch1jRAZCmz8ognzn7nExA47159hJ?=
 =?us-ascii?Q?qZMiV5s/jiibjlcj7v/lMDoBRvLXUdkbR3evMBmSWyzuG59gv5Y0ENQ+49Bx?=
 =?us-ascii?Q?vkW0WxWVoBnx+yw/xxwLCn/zXKB4nD4Wkq6hN607c7ogRzIDHPuJNIRrtnBz?=
 =?us-ascii?Q?qYdIC9ic/1huLhZxy1vQKQSo9K6XNyuxg1cYO6hTKBwq8VwugiUs54HToCvH?=
 =?us-ascii?Q?6+VP1RE9QfXmVxlGymKdZXVXSjkWIxHmkdzKAvM82tzKrWFne3J4iplEbOpz?=
 =?us-ascii?Q?3rb2w8j2Px0i/Zx1f8IYzlmiMQTAO2kPZlH+Z64dCgvLXh98SOvomMS7CvyO?=
 =?us-ascii?Q?35DIWSTkHH2dbhQ7UH9BwU9jOVOZZGJleYVSlBK8glQrzZT3C8q5C9dWWhGW?=
 =?us-ascii?Q?d/N8XPUVzBWBO2Abf4VG4/JhFjxiEP0LAdjA+q8lhk80gUC7DH5C8CQHXdDe?=
 =?us-ascii?Q?ZyfgyplXK7h3Rwk9m9IgpGTevDvh5c0PEtHTJwzQAFQyKHSWaa0CChloUe/e?=
 =?us-ascii?Q?0ZyO3NPQHdWKZ6aVraxX7oGRRDLLdGPDbDWVWC3VM2cflcgD6YcX0ueD74Y+?=
 =?us-ascii?Q?ZIc1ifGQUc5pWXx5mdfMrtY4jibwUG1WtwxKIoRDHcvlTwEVCgDBJh6ryfD9?=
 =?us-ascii?Q?4dFsNssHjyhUaUDhJTLMCUFRe//2Euc7GLug7DT9UtX0ybBY185PJvV+wdnG?=
 =?us-ascii?Q?tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849daf46-9769-49ce-7ddd-08da76e3bf20
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 13:09:36.2265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFtKKh+9jevcrRoOPUwuG6Ry87OhQ9dtlGYxAjddrHd2cc8Ul7C3j8IGM+POchh6w7D6vCGcibcDqVSzuX2NGk1FPKRltxwApHJ7nNQ81LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9515
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert, Yoshihiro,

I'm a bit stuck with the usb3 drivers for RZ/V2M.

The RZ/V2M USB3 is very similar to R-Car Gen3, the main difference being
where the DRD registers are located and additional clocks, interrupts
and resets exposed. The DRD registers are still part of the USBP address
space, though they have been moved above the other USBP regs.

There is however, one big difference. On RZ/V2M, you can only access the
corresponding registers for whatever DRD mode has been set in the
DRD_CON register, PERI_CON bit. That is to say, when PERI_CON=3D1 (periph
mode), reading from a USBH register will cause an abort, and when
PERI_CON=3D0 (host mode), reading from a USBP register will cause an
abort.

This makes role switching rather difficult in Linux as the usb host hub
code does some work in a delayed work queue, after role switch.

I am therefore advocating that users can only enable host or peripheral
in DT, and role switching is not allowed. Is that reasonable?
How can I ensure only one driver is enabled?

This unfortunately opens up another problem... So that the USBH driver
can set the DRD mode, it needs access to the USBP address space. Could
that be just be additional reg entry in DT for this?

I'm not sure how to go about this, any advice appreciated!

Thanks
Phil

