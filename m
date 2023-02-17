Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 813FA69AF4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 16:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjBQPRr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 10:17:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjBQPRr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 10:17:47 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EF26666B;
        Fri, 17 Feb 2023 07:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMUeJLMOGJGPsQYoGcZ5CFffwZWFBhjf+MQEUuIX+UzM1xdXI1Gz0XI6n1eiQls5uQALRwy8PyPOPLS4dQTKGu/Qg8prAriBXwVvTp23oV0XJD8UgN3zwIA3MTh/rrinaUZgq94+STAvdX/9P2NgMNi5dW1IJ+1AsngcDjBZY1eGR4UBNo4NBy7Pa7937EWInnE1FcKfPaLn5YbxmuMDu1gQFfJpPDZVkk6fhHVHUMI2lekfR/KGydvR6uSBEAYNRoY4Aw48u2RouIfxxQv9LI5+0m9asjHXlOAuy5MBUjJvOi6C75xiLSyc3NJgD1hHErwMjBpqTOfM5WY3ktgrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6Ip0KypQs43Z6oqMBsRCfxEFoCAgZGs1vwUnw9jnF0=;
 b=ROv/hWD5GJOD9wnNow/Gy/ckyq1zx36eIE1+lGJc2ALEyRWojOZKW9KhjabwF9o7x6ZV+iqFqlWZdAgr/OFL0NWfLQ/guHKD/J/BLc4Dbhcx9ylBhKJP//AItv9c3MyoyrjtqwjN+KNhgm6d8x36Mbx3239BEfJ49wxAL1Lhsz2cJaoG+t8AHeZU9ub52l25zyNeCRXMuTwf2mL+sV3n/ThvAU5ToylDZbaDEwGSi7eqFFxZCLVWoiet0fhyElTiQMt8H5/GSQEX7L0JaubCzVpxbAmYJ5lteDddCtdKCmsbdpbrnRvwTVLjkQRQ8hSj2aqKWznDquMl1hz/sAEW+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6Ip0KypQs43Z6oqMBsRCfxEFoCAgZGs1vwUnw9jnF0=;
 b=L2V1b6hLawTxkVDLkrN67rzPZQW+wybe6gs7NGPtXbHqgw8NFu2cuKpbyWyxFMjZbjwKJLRTINp5MfQoLj53KnsT9E1GPbjsZbYh/LSTpMjFWwBTHxo3NcokD23R0558Xi9O0okfZKxS96UF3NCjqbnhXgKgt3KVnM6airx/qdo=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS0PR01MB6065.jpnprd01.prod.outlook.com (2603:1096:604:c8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 15:17:39 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 15:17:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
Thread-Topic: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
Thread-Index: AQHZQsUCwaArevUN/0mS3MAGiYZqTK7TLC4AgAADjRCAAA+mgIAAADxw
Date:   Fri, 17 Feb 2023 15:17:39 +0000
Message-ID: <TYCPR01MB593374B9E4D61347E231D81786A19@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-3-biju.das.jz@bp.renesas.com>
 <Y++JnBc0NaGZI5YP@smile.fi.intel.com>
 <OS0PR01MB59223E65450F4EBE7F94E0E986A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y++Zt6hpNqJgvAHw@smile.fi.intel.com>
In-Reply-To: <Y++Zt6hpNqJgvAHw@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS0PR01MB6065:EE_
x-ms-office365-filtering-correlation-id: 25ccf062-76ed-44cf-5cd2-08db10fa1b91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c3X4MRRi2NUDvO7Q4pkIrNoVkjD0DsWQQmkRw/FyqoflojvYz3KUV8oxntDy993qbGL7SUit5Q4rqqK9F+BmNJzKbUDAiMU7ga1JJf3ncHpz67/mKz+xBaBHjoyApg8chP5nwuiMCwt6jA08io7ChXLNYt8J103EF6V0YZxFs+ymKMMf7znB7eDkIa3aq+ku2CV24ldDFXAcmPcDY7H4jtX1Pc2tmzSf8IeQCOedj9fObVsws8DiVye2QicBcR9yhftVqI+QyfHwPozlVIgT5xtqIQXuIuuqBv8Ef7GzUTy9l4OMfyCj4kPPAIO+8ggXSVDLdxlGVMEnTh+zjzDQYZDnSXOdoW6PzQNV+NA+i7Fmw75IB3BswzkT4dgPKxQ2b+qnm1of0Hf9/CHaeE9ALHwB35ltIsrDmyPsMbpMCbuC7ZWlz0xRUbrsfSe8PQKWs8CaNOxI8YFD8ykHrfZACdZv8nraVPIA07vxntByJBYfTICKzA85NJyPBiJ3X3SPAQlzUogl42b5sd+Vhupb3EpU5D03Qc7DNAtKVccxnSbyfEGmpPHhSAFoEI0MFa/8w1LzmaazVkfRDuStr20JpNg+5ENdpDNF0ndvaikNGTlg49W6vsf9rDeUjk5XMJU3ihvNd13nLgHvWTM0zhVjUcNczx7ijvIFrD1HhOVR2okBwj86TDFW6oI6Z1AQKnzSVQaOO79SxoM2ZHDgDQdnJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199018)(4744005)(86362001)(38070700005)(2906002)(38100700002)(122000001)(71200400001)(7696005)(6506007)(54906003)(26005)(186003)(478600001)(33656002)(55016003)(76116006)(66946007)(83380400001)(6916009)(8676002)(64756008)(66556008)(66446008)(66476007)(316002)(9686003)(41300700001)(52536014)(4326008)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?V4quS4909UdejTTIVk/hMdVwM44/z7VA9Tw6FNFYWPnKittVgSATyKKfsm?=
 =?iso-8859-1?Q?plPGBCs1ZaFI6byjiA8y3waiBD9Hqd7v35sI6eNYlr753qQ0Gr62aowU26?=
 =?iso-8859-1?Q?gkvc59Zg3f/AmqrcQw45FFl9PAQIPnBMfnFSHIRNfMbJKfG2S8/tMEVN+K?=
 =?iso-8859-1?Q?b0fLZZNhOXoWLBByJl2leGLo5vsALK9sPKzBL/JYt+NAcBjvAmb9YA33UJ?=
 =?iso-8859-1?Q?PFH3Hmi+kI6IL/kYm3+iBP9myGd+UuaJtqWbk+vDF8cJbV4MTpKxG4MUZs?=
 =?iso-8859-1?Q?Rpe9U92TubQD6iGd123vrRSB5yK7S89U3CB7fbHQQjU1Zuf4FB6nI7Ivay?=
 =?iso-8859-1?Q?FSkpbg//Wn2ykxK4+5QGQ1oHmLGBfXsU3jIq6fDl6GfmvZGiNI4P1gYTko?=
 =?iso-8859-1?Q?u8b4YFs2pR9cEpSWjnxhJgrUkF3FxAbufaO1oFtwDjdland/GzHvZ+JgbI?=
 =?iso-8859-1?Q?gIgrCwbg1k7GJD0oJasQoVnnmOJC5P3COsGd+g1b0zssV/rUdy1rdlSsdW?=
 =?iso-8859-1?Q?ZcJHRSgndfniKg3FDLeN72FFcPINPkAXtwUggMFAtyk+TyY0kS5iFTdspi?=
 =?iso-8859-1?Q?2Bp/EVEYKFVJ6yN6JLhfmZQqmqJMfLJyQhR3B+Egn4SunVZLKHJi/nEEzn?=
 =?iso-8859-1?Q?qLtXp5t71gnHSAyYM3xpFbeJ4E46ODvxjHaEKCOGTneTUO6FiB0FPtmAi0?=
 =?iso-8859-1?Q?2TQmCy1iSMMD9TF/kPbQIvRFgK49mz84cT+6TinkixMkJ0dIw66rUPOxOe?=
 =?iso-8859-1?Q?WMJ5ZBLFG2dipmL7vvGkmh6I1HFZzMNbnG7GrelemRHiP8dUwINjeWt9GR?=
 =?iso-8859-1?Q?G87F9o+G8hIPPYlY/h1+Th6iDn2nOiz8nTrWDTC/uUOgqmA5mUrjn0fHKm?=
 =?iso-8859-1?Q?YYf1b/cIQ34imidK7SlFRLxE9wNj4cmtzQg/ruLf9SPsAkZIPB38eVMIVd?=
 =?iso-8859-1?Q?or2i62TpcaMkTKF+bp6dzZB3FioVZmN4GFuDbFPmjXqamtFItBL5U7Ahlw?=
 =?iso-8859-1?Q?QsSymNJyNFEDzYxUPTNa6Uu1Zax7R8sqTvgA+mXVOtiZx39lwLzELJFiMd?=
 =?iso-8859-1?Q?iaLrJzMDZj1HatdJ9F3LZ7Q7f6FxRUiZgOs5LqE6nv+oYP8BDccAdeJv3l?=
 =?iso-8859-1?Q?z1DKLJwuzsIIpszQLVjUIT5VGahtf4vfAxQkUuZmvblHlp0xYpPCWWLaY6?=
 =?iso-8859-1?Q?NJNPjf4MvYF8k7zcH+h/BefmpOoovFIt4YdkmAQU0ofku9B0bQlJbemoVa?=
 =?iso-8859-1?Q?y5GDDuHVEI0cvfoRTLQYBPvBNZQulsNure7s/veCQ9t4tmoHcUTfiXn/Vq?=
 =?iso-8859-1?Q?D3bb0PIl8H9TEA+q+PWUVbb89MSwCfabSqP+Iu+zzNth8Z4DMdQIJIsthV?=
 =?iso-8859-1?Q?Cd/0lueqOpB+JEBF/Ec3Dyyd6uqgiEX4bIevdHDQlqynEZ+D0rkQKoIBjU?=
 =?iso-8859-1?Q?eqGZV/QCZ5eqneV9dwXCw60ZSJkeG1526vexZmuhxEIcsdx7H87tQu7SfF?=
 =?iso-8859-1?Q?jYtbkrvj6P8YJlUIPjJqYs9YWbXx/tDcyMt515XpFpcxJqW6ryPdBrg1pq?=
 =?iso-8859-1?Q?6DUDb7mZufS8oCk+7uTE7xvWrcD7oTscz5Nlym+T2P18C+b63NyugNlksL?=
 =?iso-8859-1?Q?l2nA7r2PFzpLG+IKBfWKYAoEPrZxnAZTVRyrmhVbiCziUAcxJ9KOKIOw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ccf062-76ed-44cf-5cd2-08db10fa1b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 15:17:39.3280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQZlvRqGWUe2Rnry/GQJH5xN1AIFy7NGre9+li9B8cTgUmZvBZFdUyyNiHrKSA/HtUerYD5EQw1ukKSWbEmOdkeZV6+M9FPduGqkww163QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6065
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

> Subject: Re: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
>=20
> On Fri, Feb 17, 2023 at 02:30:34PM +0000, Biju Das wrote:
> > > On Fri, Feb 17, 2023 at 11:42:51AM +0000, Biju Das wrote:
> > > > This patch removes the unused header file slab.h.
> > >
> > > Please, read Submitting Patches on how to make your commit messages
> better.
> >
> > Thanks for the link.
> >
> > I rechecked slab.h [1] and 8250_em driver is not using any of api's or
> > macros provided by that header file.
>=20
> Yes, that's not what I'm talking about.
>=20
> > Please correct me if that is not the case.
>=20
> The following text is okay
>=20
> ---8<----8<----
>=20
> serial: 8250_em: Drop unused header file
>=20
> Drop unused header file slab.h from the driver.

Thanks. I got the point "Describe your changes in imperative mood",=20

I should not use "This patch" in commit messages which looks like
giving orders to the codebase to change its behaviour.

Cheers,
Biju

>=20

