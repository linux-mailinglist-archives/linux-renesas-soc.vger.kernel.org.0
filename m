Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76FCB781E60
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 16:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjHTO7w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 10:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjHTO7v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 10:59:51 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152BD120;
        Sun, 20 Aug 2023 07:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOmrmW/s6mbW579B2EVhcWlDgQKSPtFo+wDrZkkkqicjrRBjulDxTM4mJ6Rij5bJ/ltbdLxLb7ITmmyRScWB3zqVUGFEyoOwMj14pWWROAVDAwYGZDw+Jk5x3qks6kCi+IE9T2pPgBoID87HTFPNou3qw3F9s+6aisgzjZONzd84oGAgqCl+3MzVRko4IMU3JO6C16SPlg0whPDpzjPgUojDFmdXtLt7vt+lvlFguU+GRBjqqBtT30uij5EyXz/GkyYhk28s2noBedCDINCj1gI+S9PPl8HaBiKs6UzPNlGSuL3jFw5nBHBa6NEf+DhcF6d4OkTcb7nmRldSwUz1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pihYFTDeCdBedpN6UAAWAfifMPUqc2uN2lyhSnZg2so=;
 b=WBBHrxI27T0g7bzmUKRYtUpD65UOlb6wj8tdQy5tl72WfBQJTWXfgHGjtWpz9n/XB0zMC1Hw+Ac3LLJnaekGOd5IQxTa2hgFW8pffmDbVOn5SQxdPl+6uuHYD6xZ+Ol9SxPTCJ3Oa/6xI4OZZal/Wk1VJZvKvsGIbr+KNXVENMzwLhkU4zECcBCm4as4LJ65eMNFK+88Zpp07jOh0dPtb9M3qyJaxYqtD6iUhAsIazRYnGItZQF2TLj9mv8mdsofy+Fj/mKsf69ePZZmfyvkXy7cOY3a05g2rBQqVmGpVNwsQZmFHZjYcDTKlelZwKgYD62vCgATC1SXW+tGxVQRxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pihYFTDeCdBedpN6UAAWAfifMPUqc2uN2lyhSnZg2so=;
 b=HYODCQFDjFFiqb7b7Cb4OYEsco5IQqSX9gGOf6FpCqt4omsW3ApKFaLzCsBf7ogu4tyVSoRQleWItuXGgynh6DAsE05WHuwQ3RaP9n+RN5MUlphuTJP7siKhYZSczchtSzKN6AQibQeY9rLXFZk8KIIgKxqYX44fAmMcqrRfRsY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5352.jpnprd01.prod.outlook.com (2603:1096:604:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sun, 20 Aug
 2023 14:55:10 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.020; Sun, 20 Aug 2023
 14:55:09 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: RE: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Thread-Topic: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Thread-Index: AQHZ02S7TE7/pX8dqUyN+2Y9gszHrq/zN4GAgAAK7oA=
Date:   Sun, 20 Aug 2023 14:55:08 +0000
Message-ID: <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
 <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
In-Reply-To: <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSYPR01MB5352:EE_
x-ms-office365-filtering-correlation-id: e168b316-d18a-4b6c-1f74-08dba18d72b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NZTN1U/FkzDOpmZ2f8OVw4BBsHz6fH76h2j+7n46dG1fHR4HK5sUSabgoOvmGBPGkP6+N9XV4oXNRlEbjbIlB/mwyWwOOcJuj1v4uN8lBkZcwdR6PtP+mcK0j3WFpL2SMv8GKA2f5ihBesca7yAhCfVbf0+AhchWhcen63TIv7YVkxWdK7FG2Ffqdwh/YnOnSQmygSg5+qH8FOzSDJ4mG4Qjjp7e4ztVMbk7EvPfhBXxX1j7Lk/Jgw7tn2oc2rH+tOHikRReQknx+2Z9pxmkDz5lN50HJly/UgoKO8UN/r+BJEo+ymVpl5XzA3Vna8s95MlT+JlqE1+65E2/3v851jO25MuHM1Ir9EMbVhFJuLrLdoCBU0mPI68bwyuYPvdNH8kVtDB0pGWl15V0MdFQtGNheTp0h9bJBhn24iAY+j4OatUGJIQINJyyOAy6QYUFq8XpdxmktzLYdG9vEVlkaPMGU6hnhyAy+nB0g9pOEyFaDMQdHW83ZHqVgA9tdJfgmlQyyqjLJAS+bf04aJ7JNc59vee1nAy7i2PLSYAFbTd3enBfHeCJc3JvqNQYwuESW5RROkxznG/o24gOIyTeYo3DBWk41WXAkq2GfiDYxDE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(33656002)(86362001)(55016003)(122000001)(316002)(478600001)(66476007)(66556008)(66946007)(54906003)(66446008)(6916009)(76116006)(64756008)(966005)(41300700001)(38070700005)(38100700002)(26005)(71200400001)(9686003)(6506007)(7696005)(52536014)(8676002)(2906002)(8936002)(4326008)(83380400001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?389CjQzls24lBC1L6RlrAZ5nvwn5pzOZ/pRHKW/XApDtq0MMSr7JUfNB8Hxu?=
 =?us-ascii?Q?FXmeSFQ0S0RTKkCHUa4iY8/d52d6bqHifxrh7Ra8hSNisPMnvBUbyI+yvgRh?=
 =?us-ascii?Q?q0IAgSeLr04tfk5W2evIDp0mrNTe3nqk0qcdhZT7RskVro5nm0V5fl4vZBwV?=
 =?us-ascii?Q?rNd69tjTGM+Z3ffNNRiTeAd+Rs0phElYfYvpf5nYMjfspxLzSHS77ZPIgwFL?=
 =?us-ascii?Q?E267Ec6jwO+qS/kQzbv00db2bJq6rGUFzq/3tJyCv19TgBTdgzO1xhJLQpjI?=
 =?us-ascii?Q?3PtD6O0mfGftLDRfwiU4wYCp8M8kkzTLdsjEG9jjzCa/Gw1/4o2AtyjakhqF?=
 =?us-ascii?Q?iySeegszFFNIOb3zGAVcHY6BWDlcItNkz8VuX3WzlTsOSFcVuv9X2R240y9t?=
 =?us-ascii?Q?K/TLuthO8GtsX6KWQ+/2nAz7GTlraFATA7QzKCUGMTYTtN13en7JNkxsQWb/?=
 =?us-ascii?Q?f0SJ39S+dMEodyMZq2ptE6mJwvSG5c5x7WnFMrpWW/6i8+M3x2nAE75d8mT7?=
 =?us-ascii?Q?h0BwKE7rk/ouVBx5Xu3vD/Vj69qzNWWg9v/AYgtn9Mi8X6neTZ6XHUTvLidy?=
 =?us-ascii?Q?t9KqIEBxBxWK8FdeNonkPMUQpMMEsFD+ODwXjFjRrIA4IKjzjJiT0s7BND+P?=
 =?us-ascii?Q?PH0N/p6U1LNAVkRVMJ4C9PUUvdZKCc+BxvasaTm5JG6Kinae2w6bGbgnQjx8?=
 =?us-ascii?Q?bWbpmawxNIJMBYlR4XnXcY0F2VS764C0ZdxF2ijU4fxGCRzfFc3Ago/jD1Oz?=
 =?us-ascii?Q?fTcrV8+lDfayCgu86aseDtBYAoUJnvpWv8FlX4vrdzt0v4jCbSFZMcz4AeOo?=
 =?us-ascii?Q?UwfHqgfYDGFQ31xSnLrRTwDz32GKyJCXOVaMJUrPGQeup7jOK4fUCPqSMwCg?=
 =?us-ascii?Q?UcwiR3WRnawH45lJ4pq+eIByn6jwB4We0G9bvoJ7eqGiywutqOR6CGZSFRNj?=
 =?us-ascii?Q?Z4jJqJNKN9c2EWc104nuXJLE/3YwS9Nqs/UG2hb9j5svDNGuGommxlPzi3nG?=
 =?us-ascii?Q?SePvo93OsluRwXaGtZSmY/Feyq2RmXuG0EMFvRiKlklMprxjDo9Zdj1Lhf+n?=
 =?us-ascii?Q?XaVIQSAE0vReyf1raKvVhH8Uxs/hcw5aeDZaoncWBYGnaywO3pria5p0syhY?=
 =?us-ascii?Q?lYgPaSSfU22PlSa0cYjha3fxrpQAyoWOX1z8sOf/cYYT/2JfzzJJt7Dx66P7?=
 =?us-ascii?Q?X52XB3wZJzLxQIq5tuz8IHKmzrdXTgofay3LrkWiXSoRXyDLdvnV35hcw1Ur?=
 =?us-ascii?Q?AstTmNM+8U85mcJaJJy9jerojgoRZrDwq3SjkoADUIWxjqlKT8oWPMwWNMas?=
 =?us-ascii?Q?unsqJO2k0Emk514tsRiYShTtBhLOJwbQb0e+sGdAhZlbmMBtWVbEUi14sukW?=
 =?us-ascii?Q?e8aJRqFn/ORsZW7MoUTX1o53P0VAGNPNK4nZhBEe3oegGdQFoF1jo7ZCV3kB?=
 =?us-ascii?Q?Wx79boWZQmyA2SzIZuC/0go1yFNz5ARlBUyLRBzl0qRe6L5DRxsFShYWPJT0?=
 =?us-ascii?Q?ZxsXK1Ct4BuxAg9GxBoxqu41qOS+dcBqZ7JXwQYlNw+jhX2+Vq41NRUBoq3t?=
 =?us-ascii?Q?6XpWGshtf44R2ALcafOPA9RgJAErD6sLnuXPdVJY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e168b316-d18a-4b6c-1f74-08dba18d72b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2023 14:55:09.0197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kqF+mdWz9jhH5B8GpUzWeQUbRQvNcbEIwQXp8b4IZxsYjAJmsNuNkBGHhjQCGLitkn7SVR0S6eDrAFdcueFRAQo3sN/+N3q+Wlsk5jytZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5352
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Guenter Roeck,

Thanks for the feedback.

> Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x mat=
ch
> tables
>=20
> On Sun, Aug 20, 2023 at 01:49:08PM +0100, Biju Das wrote:
> > Convert enum->pointer for data in the match tables, so that
> > device_get_match_data() can do match against OF/ACPI/I2C tables, once
> > i2c bus type match support added to it.
> >
>=20
> I don't see why this would be necessary. You don't explain why the curren=
t
> implementation would no longer work. Various other drivers implement the
> same mechanism as this driver, i.e., type cast the return value of
> device_get_match_data() to a non-pointer. I'd argue that changing the
> functionality of device_get_match_data() such that this is no longer
> possible would be inherently flawed and would introduce unnecessary
> complexity to drivers using that mechanism today. If
> device_get_match_data() is enhanced to include the functionality of
> i2c_match_id(), it should be done in a way that doesn't mandate such an A=
PI
> change.

Currently nothing is broken. There is a helper function
to do OF/ACPI/ID match(i2c_get_match_data). But Dmitry proposed
to extend device_get_match_data() to buses  so that we can get
rid of i2c_get_match_data  and future it can be extended to SPI aswell. see=
 [1].

While doing this Jonathan found an issue where it won't work if
OF table is using pointer and ID is using enum in the match data. Moreover,=
the proposed API returns NULL for non-match.

So Andy proposed to convert the valid enums to non-zero or use a pointer.

In this case, pointer makes sense as the hardware differences between
the chips are compared against type rather than using feature and
driver data. In the second patch, I just used a driver data to
avoid one such case.

[1] https://lore.kernel.org/all/20230804161728.394920-1-biju.das.jz@bp.rene=
sas.com/

>=20
> > This patch series is only compile tested.
>=20
> I assume that means you don't have access to the chip. Is this correct ?
> Just asking, because it would be great to have a register dump which woul=
d
> enable me to write unit test code.

That is correct, I don't have access to the chip.

Cheers,
Biju

>=20
> >
> > Biju Das (2):
> >   hwmon: tmp513: Convert enum->pointer for data in the match tables
> >   hwmon: tmp513: Add temp_config to struct tmp51x_info
> >
> >  drivers/hwmon/tmp513.c | 51
> > ++++++++++++++++++++++--------------------
> >  1 file changed, 27 insertions(+), 24 deletions(-)
> >
> > --
> > 2.25.1
> >
