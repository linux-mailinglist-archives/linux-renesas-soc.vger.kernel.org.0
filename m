Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2734B6682
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Feb 2022 09:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234264AbiBOIsw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Feb 2022 03:48:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234801AbiBOIsv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Feb 2022 03:48:51 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66FE1133FC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Feb 2022 00:48:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKvQJQGuo6kA2qG2tRpb614MULBNypjnrRPulJPWOZnPaw8SeH0bqPU5uYO4ij16PHUVHQ7AG+ySvPI+WY0IhapW1MKmOvCkA8IaXA1qpUI5WE/A+/6z8jN3ZxtgYL5zmci7hsUqPuVm2hXwnBSOCY3Euhj4j22Yo1TItbs4a+MaZzAb5CNkE7TOOYoqgqws4jKGGs9U2QlV9+2bLHSZnF0vVdTGBNBClZIiLluLiq2Bff6QpjaUVQW7SbuRc7HuTS1oVcsUqQGM+U7CX0MjwZaLc7jKWm93dKBoM7vFHUwMWYxlqaDph7bHIxzK4q1n0AC2xRGd5XbyUaYknZxBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U0M1eErm0aWicff96K84H2+UOoUhOmleMeM+vDY/oM=;
 b=SGesEdE5i5BQi1Pi6fqYbIL0ylAT3oai6l7f9a34nUJgo2gLsYLce9EMCL7UiKZStmVXEopSW0lx5bGGMWC8qD+eQiAzrOcSqoE3IxJtz7K/O8pIyKlchWNFvWMINVpNSBIfjejvMRHDNHXmQzrEs4IohBhX3ot48DQCU7ZNXZi6OmscKpVF13nY1nyGzteEOoUkpZ3xAQhBfUzRX35Y8oLphcUaWNLqfi20r7CEeuVHB+8yH8TSR71640PF2v3gYtACpGIUOx60jgkjE5ZPWM4+WcRfJM9WFerWwy0SMH2DlrPE/Np9hWbvgKFbgVMxy6wWOOmGk+J8vHfQe3KsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U0M1eErm0aWicff96K84H2+UOoUhOmleMeM+vDY/oM=;
 b=lKcDFsyIjYcL4cORsSPxrXHEv9jr0Yx0TSFzDa8VmWmBsieCA2B16k/v8dPw8CAFKqcSduhjnCDxayNK1aP1+Vz5J/bDfQMaG9XqIJAbsXKYIE0uw7uj7lXCTc5QEd/rd7tS/JL7c7ngA9rFLukUvptkX6zDEHkghxw59R2IYgk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB7108.jpnprd01.prod.outlook.com
 (2603:1096:400:c3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Tue, 15 Feb
 2022 08:48:40 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::346f:1a56:ff4d:8c0a]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::346f:1a56:ff4d:8c0a%6]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:48:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Hoai Luu <hoai.luu.ub@renesas.com>
Subject: RE: [PATCH/RFC 03/15] pinctrl: renesas: Add PORT_GP_CFG_19 macros
Thread-Topic: [PATCH/RFC 03/15] pinctrl: renesas: Add PORT_GP_CFG_19 macros
Thread-Index: AQHYDT1ApdN6S/66ok2nNf3MyH6iR6yUdvow
Date:   Tue, 15 Feb 2022 08:48:40 +0000
Message-ID: <TYBPR01MB53411F3B3988E488F7D862D9D8349@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1642599415.git.geert+renesas@glider.be>
 <b2c72cceb9f03803c80d65eed2dd273adc1c3a3f.1642599415.git.geert+renesas@glider.be>
In-Reply-To: <b2c72cceb9f03803c80d65eed2dd273adc1c3a3f.1642599415.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2343aa2e-2204-45a7-ec15-08d9f05ff6c1
x-ms-traffictypediagnostic: TYCPR01MB7108:EE_
x-microsoft-antispam-prvs: <TYCPR01MB7108B48A4A3D75974999E457D8349@TYCPR01MB7108.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e5R46gKmgbEeF4a0cj7Td0CPtX4fxk4KmSgN8VH1x+Fe9vg6YRSvRQai+U5bpGByc9bjoFbMGhDk3kGnpz6JK5ZRuhXisaocZGOgMs+YkjLcJ0jTB+GVWGF+Ognn03VW3P70+Yt2MY4aMeSxbt9IgVuuMAtz72haY4KS6osR0W+Pz19y1e0vfx4cNuNvzmjkMCvLZooy1Vs2qm/dEOcC1386xRSQs31DFTxMYgqjkwvGPUT7LZtYp+UhNNKmgkwe2oG+wbuESQd0zCUk3lQ6h3GLlmQHM1s9rjf3zjgD87ZDh6n89Au98IWwljsu7KOWzCb6Ayvfkpf6ThAhIkwmvnPHiB2r/sz9ZU7bXmMtu45T+YUegCsb3OraXQdj8DOSIdP4qTwLJa0XO+QVtQ+wobsz3DzNKmXLsVmbgEjnOwhT+mhC3dgbNSYyXm84aOzFtayDAu328kCMwmnohWAuoM7qrS4DLD1VFVxkHOXGZUIwfAHPVdhUGlyO6uvXX6Tq5OyN5uG6krDnJdKZkxcQLZyGMBvA/SUXEEbWCPvet3OEZSHSQH3PX/Im4SYus9Z8X/tEeBrPA307rzPr3yIvW/XyKIVTl9tm22J9hN061jubxRk67zlHe0ywTeoronhGAQZ4RKoj2S93kTGRrZAbotvo1FjBkqLJNUW7qWG3egmEzCccayyCl/A8q9npwMpVDhwIFN+ozXHBAv9/cp+Xzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(38100700002)(2906002)(71200400001)(55016003)(86362001)(9686003)(122000001)(7696005)(6506007)(38070700005)(508600001)(107886003)(316002)(66946007)(5660300002)(186003)(52536014)(4744005)(110136005)(76116006)(66446008)(66556008)(66476007)(64756008)(8676002)(8936002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gs2rUSQsTzmHiEkgs7OonwzbsZ8sL+7hfpvSQBqezPeXPkODQpPLHu+ULkly?=
 =?us-ascii?Q?b51YPQ+tyLWlJxKgMd4Tg7e47tA6xER24zPbPcUN2vTT2U1sxRgNm52PAvqd?=
 =?us-ascii?Q?OP5OpO9grf0uW35M5wvBlAQI0Tix5yoINy9dSLYQMKeICVGOnHuTPALfEGui?=
 =?us-ascii?Q?srKyc6CaLKW8uVzPQRlAEC4NdM0FCkQSb6eJmUFtht9MC+5+m1wZM6370py9?=
 =?us-ascii?Q?AbhSHHTnDqthI14EFIVBNvs1ulzzVd0+bt2xo33DYmJ56ZVy1BB9PJbaHcHg?=
 =?us-ascii?Q?e8BhRUINgt+yHiy292vB58um0YFVZTgEepz+eNks54zIXxkP5U7dOkjP4KcE?=
 =?us-ascii?Q?9hNzqZ+W4WZm66l4aMlEhxNFJw+3/vbkPe1TcXeiGw+8j5JuJs10yJJkclpH?=
 =?us-ascii?Q?+6VG1YqItJDOptuTwbuwYZa3OYw+GpufjV2Vlbcdlx6Ze45u3kp+6esoMnp9?=
 =?us-ascii?Q?gIIxgLgIoCfGvlPwwkyptyiQ1eVLn8qL5LEnNDJPBE0Mmf0r2Tun8q9KQFvL?=
 =?us-ascii?Q?4w1Ou2SSN/p42ZWdJhpe9N5zI1lQj9JCzmeMd/z7W7lS7FJZAiw24MJns+rw?=
 =?us-ascii?Q?FuYEUfVTRwusvatWnXfUEecUPmOjZCSUhIKNltLW2SgedbvrNpBfxcJ1hijz?=
 =?us-ascii?Q?Mmot5ZlIRDqFUKbY+LJIlAzsJFB3h6TJBYh0Onhms93U5b8mbmPnqCjz6Yyx?=
 =?us-ascii?Q?ay+FbUiB33ge/TJFfxrMwkOmIhRAks298laLViGzQ02P6wKeyduVX5zWBuEm?=
 =?us-ascii?Q?4Cw9Qdt1H8bxBU0kfresY9R60BmhdmttoZOI69nlz/BEnIl+gBIeTS5Tj/iV?=
 =?us-ascii?Q?78E6qC1t8eBEiJvmjjABV3hYaNBMHOA38u7YHVCl9o0WrkesIWFwuM+ApiHm?=
 =?us-ascii?Q?LiCQy6MPX3NIDMPFh7vMTi4flObH5C8nnxpKH+TWNnvlc+mwNWaf/9S24HOI?=
 =?us-ascii?Q?SSsaVg4Hkh/+OWo+H0a/cG8KHJ7Z0jphg+VSLISz8VnmkS21vhE75OTRISHD?=
 =?us-ascii?Q?iLlY/bvCfpvSa2WrVCo30Eyrx7pp522jLTY30KwSAcylhkCYtilSHDbVeOsk?=
 =?us-ascii?Q?hRRij8kW0nRWwKu+ssZp8g4si4KcALkz+fUpV5YuYZzexrlIDEeyKLUB8LUp?=
 =?us-ascii?Q?dCHu2GZoOmTMn85L/kxf+wm3J91dnqjwPlB8fNe8xTANkggljQ7GvraRlQLS?=
 =?us-ascii?Q?PQDzjezAI6RBs/7CVI2E0wwlspdD3aqdKaTo8jg3WVTnVzNO+dYESLSfnQ4K?=
 =?us-ascii?Q?XPJwnrEtfTtyQ9MiOYHUhkozXzsDZNAgqAqUh7Ux6mW0yDF/Zpm/cuoWjumm?=
 =?us-ascii?Q?eKK8vM59bBRFA2LsSAhNmTdwN0o7gFXsIVmOTsBFdHFHm9jJGNJ3UYEzwzq0?=
 =?us-ascii?Q?Kk0CyN09KFijP/i3tgDJokBe6YN7EbM0/76lD1w+yTUHtxVrmKkX6fcl8gMI?=
 =?us-ascii?Q?yzr8qY6U3uXghaBqxZVs2+GhCHCHU99RbGOjkWv7KXDgmD2hwW/kCBQ20BTe?=
 =?us-ascii?Q?H23Q0ORVnPT3rAELH+pmQb+oq+h03uXp9CRl/KC1Xch74xQX3t2j3kyQM/iu?=
 =?us-ascii?Q?R74J5++pfUytZVaXiji2nTrIfaZYYOgfE2Ai+Q1gowERM6PgOhsDS48TduRl?=
 =?us-ascii?Q?LfIQjttF9HHvELID4OhX4B0jo+xAFOSd3GB5ogDj+lP+T6gCpQt5HGyZMNYa?=
 =?us-ascii?Q?uJwrMkF3Z/guzFcRcls+w5C1VVJ5CAyBz2c0C2z+irAeXR2AN5H6FmoRe6f4?=
 =?us-ascii?Q?iGQUaDmyyO5juoRYKN6ne7UrjQ37QjpJwM+EZFqbZ7gF0satNmk1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2343aa2e-2204-45a7-ec15-08d9f05ff6c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:48:40.1630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AEyFIq71RrZJX+NvAN5PrAOnLRXMCHIHLaYRjSlLtkj2AT5TwgTUEVhRbLp08cep2j+gvnPOWS3/UdxXdL3vah9dDYVZTR6O+MQavke0K5aB91RLso68Yod5C7NYz2Ff
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7108
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, January 19, 2022 11:02 PM
>=20
> Add PORT_GP_CFG_19() and PORT_GP_19() helper macros, to be used by the
> r8a779f0 subdriver.
>=20
> Based on a larger patch in the BSP by LUU HOAI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

