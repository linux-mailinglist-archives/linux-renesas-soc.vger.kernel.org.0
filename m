Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992A84CCAC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Mar 2022 01:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbiCDA07 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 19:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbiCDA06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 19:26:58 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FA1111DC6;
        Thu,  3 Mar 2022 16:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jysDOBqEtOBtOfJvpmnPCKTEovwNB2GPZ/ioaH0kmfuqnhw2Vbfwf88eVjOS7+KXF4aN3NLVO/kG6kjZ8GrZqdXwcS5B5BRvr198G2fe1ElNR1u1fJgV6aafpsaoBoRo3+ZbMbK0nCPMBcHbqeok7jXTySygR3S/FDqCclihmEnUz+hqU1AeZbE9CCXd5dR+gfZ2N/z2qGuKovU6CBvNUwdT4CYLNH5ZbeJpSQnIk0Q4q+cd+dnJ/OZGE545NLhVNweGd6jnJFDL8gBTytKeZEbA1dRrcgOReqkxA0iCjmrUwxdjFxm64AvVtCNn1FaZ8/wEM0JBEtvQT/zmQHRMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGyNyI5nCDrHvS8NFN2J52/P7Y9o0TkLRepnVl8TGd4=;
 b=cd6/IdNlWa65sIX5KiQtbClXaqvq5+DeIugwfv7RDeo/Qw+fi953iRN5jFwlg7VHSXc/+vYzOil46NK/rU3dmjrxXLC8y9UnRJz0LTaMh8cV3oV8AuLuERVUCdAl8mI9q0MJVxEUTf5BiYKIoYxRk8o4pJMx7UaoFj19/xFBm4JhGufB6RwexbapSi3XYy011rBhg5QIDCH+J47WtvdI0oXD+w9EGng6iWRSxF2ugWA4cNQzKAB6lEIaJH+umzpvv7H0mowOMqifvmq3UkaGg+D/xRaeuiIDQ/jke63JRzxZO8qGMJxxtggOu9tByDjdRUAwjkPTzB4WTjm1qF0RPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGyNyI5nCDrHvS8NFN2J52/P7Y9o0TkLRepnVl8TGd4=;
 b=O8D9WPdA1Cx5wZNBBUYZD5LnFOzPytWR8r+RaDQJuE6z4Vmldizq8D8CLnsYCe7s/2Ee1bjEcFLyQufdOBb+e7MXD1hH0bo/6lX5PebcA84TLbhS3/4qCkc1LCM5iiBmRRVp802yA825C2JEAFlJcWfMwm7e5xVjYOHJ5YhLozc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB8905.jpnprd01.prod.outlook.com
 (2603:1096:604:17d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 00:26:09 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::458:e316:da3:511a]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::458:e316:da3:511a%5]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 00:26:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: Drop commas after SoC match table sentinels
Thread-Topic: [PATCH] usb: Drop commas after SoC match table sentinels
Thread-Index: AQHYLv1Bjfx4xU4aO0WtIxf092Zun6yuXq4g
Date:   Fri, 4 Mar 2022 00:26:09 +0000
Message-ID: <TYBPR01MB534166BB0BE207A6A7215E38D8059@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <5cae409f647272a5679291ebc0000bfeccc14160.1646311762.git.geert+renesas@glider.be>
In-Reply-To: <5cae409f647272a5679291ebc0000bfeccc14160.1646311762.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2867a85b-c756-43e7-4d9f-08d9fd75949b
x-ms-traffictypediagnostic: OS3PR01MB8905:EE_
x-microsoft-antispam-prvs: <OS3PR01MB890501C732FE5F0665361C88D8059@OS3PR01MB8905.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CgpYX6lNMPqOnJSTapGU650cnq8dA4fauM5R7NoS0M/kmyuDvD30VBtZJc8ZaABw/m1PaGWpZ6R58i49XqLNkD0wMS6A80XawLLd5mV4Z83zebMtk/w932RAx8jCHIr3DkYcOEkKVUcRz4+ZI4hcgc5kfINSJrjoFFij83aoqLAG1rdwWslyl2oOM2dcbAVJfF9s7H0CRGQ5S5cxl+grdaC/l6/8FTCnbMxV1YBsWC5DJ51QgxaL0lFbms+z+52sEW0+fUtfUGGao0Wym7AMFPtoU8P6f37quw/OQUlvtdt2acF2DRpO5x7RpS0QpNs8LCMRbxG4oi1hcFu6F/M1oRG3oOXGQV5AEgkkeZia/rg2JqVK0jaJBFjW26oUOTjXRbRJhLvhzXVJvnkw4Sv6Avv4J9PJabH+s6l9nJix7asVZoZrw+VRFYsubJjVBURnt2F0cgJyddoSN0jl5u6HbLMtKxrELyzvvC+eueOKL1otE0B18d8h0ghtQOOZUN+VLvkfXcCBc7lvtAoXdXAjxqhewvTMFoy2vK9i1QYLhuXvvoAamUyORLLqejKe7QWJHU3ASDy8IYnWxSmQo3JDXQ2Mesxe/C9hkS+Hn6eUZXjXaQclAOJ5Z245BuVyNzr9A3TWfIvyk9Xyn4neev3KtrUTTfzsmZ6UVqJzj57XtA/98km6f/Ly4YSr2ZKKbbFlPkEMW/i3tUbD4FJ/NqcRxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(33656002)(71200400001)(86362001)(52536014)(4744005)(8936002)(316002)(122000001)(54906003)(2906002)(76116006)(66556008)(55016003)(66446008)(66476007)(4326008)(66946007)(110136005)(8676002)(64756008)(9686003)(38100700002)(7696005)(186003)(5660300002)(508600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qs/l0SHfZEBx4+Z/fbUpUY8bQfRYE9rKN52O33zGe4icSZSCklGtjD9nH1SI?=
 =?us-ascii?Q?JbXupkhn3INrZkQF5ZDpnyaUITZC2YpFHRPzAXFgjosjtcf0ivvSvyo0mkDN?=
 =?us-ascii?Q?kt2TaFD2J4bDyP0FHvUx9fXy9ua5tBVHXf8niFR3iXPTOEsk+nI0RxCr03VD?=
 =?us-ascii?Q?7IL+Il6j+XSxR6JnqsXuVkQmBAHpITLcnodfcsGWR8dGoAjbwnaa3SW/OkMc?=
 =?us-ascii?Q?kwCTAxIiiJz0nQQ+yn7tJPEIn+gk9onyLtxnSMV1qvHz+QMn6CMp4JTFj2yW?=
 =?us-ascii?Q?GQEmdIv2sfdg4nqUVtCGR433OMN7gJQMOBPNofYS95fvGxlLUYjJc9B1vE/d?=
 =?us-ascii?Q?j9lT6EymQDGLHg419b/X5zHm6lkw1Z6yA33b8CY20gUENpPWyvi8o9d4IJPu?=
 =?us-ascii?Q?LgVJuzBIw5BbCZ3tFiztbEMPnC7pUZjYzWxHquGwnMLKlaUtPm6Blw1KkM1O?=
 =?us-ascii?Q?5Z/DNB/WEopFrIYrbDBLisa4ow8IoFu070OIhza6LadEyhfcIAsVsjXleBV1?=
 =?us-ascii?Q?3FddbCtF/f3pcV5RcetMBvQWGSMYWtwVs7eJ3XAFr4I3nk/W7EsaZ2Aimcw4?=
 =?us-ascii?Q?OvH7rmDbOIKJP6mSZifzSCpbi25UEw6kUybkS6vmrW1mMh+7Prycofe0juN6?=
 =?us-ascii?Q?SCBIS4PvkUg6VaTCZhtRH7Vpjw0F13ggtFUkWCXQRg5hWSGWwB6id2G4fngA?=
 =?us-ascii?Q?OGqKYoGObZjFBQgxmjA6RbTqYkbRpM/XewKeb56MKWlFp9jmdbCfsE8VKn+G?=
 =?us-ascii?Q?H7O5q8u0UvovHL7na+TXZTKXWjINLmZA8teSBdxa2irVm5ZO6F/JwgaMJ1mb?=
 =?us-ascii?Q?h0rPRS3A1ThfEu75JqCjjcasjWbvtidijwOdIzFzg91Ai6zgk/6VeeEYgY6C?=
 =?us-ascii?Q?WVAWr6ASTpcDkaH8AWcd07vaHojntKjmVkZpZ0vwlOGSb2STSo4I1TUDa1AE?=
 =?us-ascii?Q?gNPvaoRLjP2K7BUVW0iPTTLgA72zLIoAQUc7/DpOXrCS9t7+0KIvftmJG886?=
 =?us-ascii?Q?RuMFq0VJbkpYA8y/upsss9UrJAL6fV0YSjmQ5WcYKL0W3XCERS8qe4LDgGgL?=
 =?us-ascii?Q?SHZNZbRzh1gD8NIrtO7UuWK2JzkOc8acpyYV2ThEmsyycLi8nKrDpjitst+y?=
 =?us-ascii?Q?jeWEBiPqQMGJn76SuqAIbd7Z9hpThe5TeMFZ2wKvHkWL1zBZNsUzF4AZABHI?=
 =?us-ascii?Q?xl66dwnT9mfzRBgF2OCMpmqZrHetsN5NW1nhevG/Fl5UpPcrhTofRy6YgtM2?=
 =?us-ascii?Q?HDcljY+KTEnflwg80sHBC+awoEbAPWnSwIrVWFegik/MvUnTfp23C5eFI7ya?=
 =?us-ascii?Q?h7VdjcTpIm+C4nOe/GzQhD/+r9emcQT6Bai+j1P6sWAbfBpPsG59HXgc7xnL?=
 =?us-ascii?Q?JBbUt+sDO64JBnXyXvpX7Vp5KlZWqeD0yMyJQD/d7CJ3B0QEfuDdIX0O4I5g?=
 =?us-ascii?Q?YL85yhD3B+506t4HSkE35umtu+Y5ZVF9MoIyXO2xF96XJJwjKq1IFHt2rkOo?=
 =?us-ascii?Q?Lrqk9R9zrAOed1XLz67Kyn/SqSLjsnmFy1/KcvBgVL6iL0vtNpR4Cv8Qkx9O?=
 =?us-ascii?Q?ihHdz9bubyxfgFRC3b56y9ylIYj2Y4qwsN9g/uzcxYZ3i76/7j2XpJHTSR+X?=
 =?us-ascii?Q?vJNYd3PV4TSb9AddJfRoqJ/tAUpe9HA5jzrwz7VcnXFY+059IhdxT2oFDJXx?=
 =?us-ascii?Q?Iu1XRjf22ibRfOtKoNKKFjJXgyTwrlzZctVeETF7omkrkObXpd/46lFYfSxE?=
 =?us-ascii?Q?flJJWpL1YLkI3noTH4oTXQybYLxU0n3rZ8z/GFbwHa6gwwRn+QZd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2867a85b-c756-43e7-4d9f-08d9fd75949b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 00:26:09.5374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mO1D9f6Yfxs3FSnlJcxbfcSxdl4BP8jZvxRo9nZ/5zCVlp0UAtxdvfdiBpBkRa1WIAVRtQHg6OGRti2SnIRtt5ucVFkX8MrsIUmylbOY1eYsp+TDRbdA0o7jsZw5Jcdc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8905
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

> From: Geert Uytterhoeven, Sent: Thursday, March 3, 2022 9:50 PM
>=20
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

