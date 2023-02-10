Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF23D692125
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 15:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbjBJOvG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 09:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbjBJOvG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 09:51:06 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2109.outbound.protection.outlook.com [40.107.117.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9BB17CE9;
        Fri, 10 Feb 2023 06:51:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRkZzDh36SKUVPNVYYKRzSQ1ezZ/1Mwkrrb6qBtp8X9oiMN3zajmnku8fVn+tH4+TQD/5BgS+vaXry58k10jmO42n84yf84d83LHDC8BtpaYO81aj69gJDyUYPQJgiRUdnzXrdlMuidnO+6n6raUMGgl6zqbR83ks3Rw2gYfZmOsUptiQLnDLFhdcr9L2G33IhogcZGKfVyd/ETcnuJAzO6ct0SZ06WC/yu0hRsP/Mrv6QDb8o6C8ehsU8XztPjKy7Qf7DKTPyZUfrk62/DnjLEGpU2OYkYHfgzNKwubKqicrrqVvjMSvppmD3UOpGB1I9P5dUBNFVS9gc8ZBJSchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ud1B+5ztzPaXDNPFID4yERU4pEIbmJkDg0OW3V8YK2U=;
 b=E2AomAm1dUBwXPaxJQUQC8UEQO+FrB+o5TPD9PH6oYJGNoXrVApquOSmIT+YRqpMzJFecKu9Z2N6CwSCm/JNZP6PIIejEgR0WuWXYG07OoMXEFgwsV82EtjPaXo2b6qzk2tFRy47gKBKCyOGqRCCW4GL8+Zluy9bXZC5EZhkb15MJingOzQNn4MA27ukFksJe3sMycBk45c02cy26OZEb0M/CyU3IDjKsdST4cpvSNnivyyQ37HHX3EiX1SMEJAsE2Dl0eFd3vuEf0pk6lSQPMyUdNQ2RFTXTqYsSkd3YoVSZ6YgnCobC7hK+MpE5lvMiEXc4XWjdEuplO7+3ZUSaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ud1B+5ztzPaXDNPFID4yERU4pEIbmJkDg0OW3V8YK2U=;
 b=ds/xTLEqU2TFubhhOz8VXqgmj4X0Ze9EerUdC92ucTBYZMxBg213lg6kdzwJEg3gv0G+k7Hxd3qbJptjT5DWZ2nF0C5SGas2eGi3LVVq3lK6jdRV82FWhmlC+C3jpZtX16VmZ35nE9SUir0iacSAv3zktbzsGYvex13l4lshs1U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8323.jpnprd01.prod.outlook.com (2603:1096:604:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 14:51:01 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 14:51:01 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
Thread-Topic: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
Thread-Index: AQHZPIosskWvaTdkmUGyylzcIx5dHa7G5c+AgAFN56CAAAIuAIAADvLQ
Date:   Fri, 10 Feb 2023 14:51:00 +0000
Message-ID: <OS0PR01MB5922C2E1CA0EF87458E21BD686DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUXyM52qK1=yPq10i9n2apqO_Xvkvbvo6m5pYQebrJ7DQ@mail.gmail.com>
 <OS0PR01MB5922F0B044AC56675BE5E6A786DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <732c82a0-6421-6a65-f6ac-6ac846f9f4@linux.intel.com>
In-Reply-To: <732c82a0-6421-6a65-f6ac-6ac846f9f4@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8323:EE_
x-ms-office365-filtering-correlation-id: fb667c23-a782-4a69-0b66-08db0b763a06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fLVHdrYV46bxGtGMLXQWiKLXKb0+vZN96gWJ9yD39h3dkz2Bd1opZ4anLvH6DFRp53bX1MrnblfwehK+qwiFMGFT5YQh/7/CGIck9mx9VUyTfag804BoLSr5FAj5crEXsOgIgn6kqhPZJUAjwIxU4aE21mBt5xaPxMk9IQvNxJFNE1RmIc9Nl56WjIQTFPPC+r1bgC07GdMQkfdwW+mOHwOjGS7wwWwqr/u2NvqyoJgAZxxLkxGGG03vO5qar0oy7Nhk/8O4U91tKcE9U9Xg04bft1tZ4y7cKcqq2V91LDlnAPJI0xG0JVPQoBB3/ut1Yj9PBSpY5bvcLXibN5fjP3YIXTGFEoKF98WyldA7+3HP7O3FH67U8vV/0PZ56gbBPG4bn3eEaPE2xKe5wP04AlKeZLWJsKFDdQ2kGd8STyJa9JpUK6GR1iUueGglyJjXgW9ou1nqnykol4KKNQNsS/2MWx/q4fl68qPdqPBr/h7NGV7zGIifSI3BRcB7mMVEwuQkWZXbbPiU++WT7B2XR0cqJ3QY3FvnPI6JVWCN7HqM03/K/6vqAeOZ5Q9dJZksPg0NsBn5RCHYkiz1bivjZhIU/XLrzlZcrMv3RuWYgbVDz9QLQbt3XIUKPr0qSVE10zKp8hDfP22rUbtpob8fLpx9iUtRhr2AtcCfGeVWIDdSpEwK+vagcsPUD+3xTLTX1q1KfvDlx0KDNy3RCuDVrQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199018)(6506007)(26005)(9686003)(5660300002)(186003)(8936002)(52536014)(53546011)(55016003)(83380400001)(38070700005)(86362001)(33656002)(122000001)(38100700002)(2906002)(316002)(54906003)(478600001)(71200400001)(76116006)(7696005)(41300700001)(6916009)(66476007)(64756008)(66556008)(66946007)(8676002)(4326008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?l0M3QNT1yfwbCmHRrSCVeKVsk0tRZHa4F39mIeAcuzegLBb0rSKaMDhp1F?=
 =?iso-8859-1?Q?aOhyR3J+TSBKnnFNJllMAfzQC2KzDZ58e9mYxDFJ9U7Ti2nwDdVLDiqxSu?=
 =?iso-8859-1?Q?eZxoZdWbwf1pqEu2RPzClHKdmalnR59siJ4qCQmDDywvDxxdNQOUcVj+Pl?=
 =?iso-8859-1?Q?PgIQ9zOJYnczMYp1MQs9Uu9GqU0ysCDrpnas/eZOiMwbzMQi4RgoW90Yw6?=
 =?iso-8859-1?Q?g4DvlvziF/Bj/QXY3gveKwDjaka8UbaxeNpy7oV7kMthbGKaI0UnR9z8Cp?=
 =?iso-8859-1?Q?2oWzA+W9Y1soUQrW8Jtgg/qoc7pc16KtIiXk4wIcHTRXZoySjgQx693Lic?=
 =?iso-8859-1?Q?edw85sYqo6+KUfbDE9NX1LOnjGbI0hWQfx25eWTHsfwS5oxR7tDrOyOZLa?=
 =?iso-8859-1?Q?gKtzGVugqixyKj3LuIn+Z5c4PkK2vVx3BrXXCXx6yHPMdKoxp9U5q9Annx?=
 =?iso-8859-1?Q?GJF11EruaglHjGRlOpVwWF+pRyAmiKXxh+EID+Lbw7aZOQpiR3ubfJtsWa?=
 =?iso-8859-1?Q?r7/aDuWVa/JmGdc6mxQiY4TH3m3xNxtIHeQNnsYwAOBXKttOBQHN2T142I?=
 =?iso-8859-1?Q?bYTms1CLWraYXp0DsdV1k+smN0b7EdQKh5PkLeDbziBXPmtSoOJ4GMmcyz?=
 =?iso-8859-1?Q?wn0RxqcQffNMEE2iRsbfhlJNc4Q/qcR9wB7kKgdVl4INcQZNQYPstUxEYS?=
 =?iso-8859-1?Q?q04iT8vya9mTyubMwXv8mGERn1tCLrxlVUYOoyblva1sjTGcHLn1yDe+Ts?=
 =?iso-8859-1?Q?xSR3pshpdrofnAM4W+m5FfExkWUYy9lcfs70wnqlBA48UBOAzBs+PJXDI6?=
 =?iso-8859-1?Q?8ytla+QuEyq8BIPvTObakR+CBB6l6NeanV6midgQMKQ+L/tCyG2CRoFN+w?=
 =?iso-8859-1?Q?69JFZM9+y5cVvDxfrG5wSvYz1PeRC+8B8sKvoSdtdytnfedLGl4Fosj568?=
 =?iso-8859-1?Q?zpjXrSQ71G86r5gdyBDMY/4f78rdmBmhgqub9XOryY/Cv19AD6Px1ur0fI?=
 =?iso-8859-1?Q?yqIB964rusvqJsPpB3mM55b1egb/MeEJEwAuUsKYatDnZ8hR6OV5z0zMek?=
 =?iso-8859-1?Q?qlvvZ4PIu3lH0Z8wJePkxdyDZtPehh1C09mTKorxEEdvGvdRQrJFcF+yUh?=
 =?iso-8859-1?Q?xYGCGKRwEHO7Oo83JwOvdBmyai07fRta3ddLu3Y2TQ4uaCpo9Dyzgs6xiX?=
 =?iso-8859-1?Q?28JfQM9rUEcpcslB5kSM2gVu/3Q++q1ZxicqySHYaPEs++K39CO/gpMwAq?=
 =?iso-8859-1?Q?1AOJ0K24/2TRXFvo6JrECjkVN1pt6xvv7JVA5dld6gFyi/FO5Em1WOJvEH?=
 =?iso-8859-1?Q?lAvNIVZyE7zVGMrE5qS/cs/NKt830JSaZKT5m3dVuG4FsBzaH2WX18sf6y?=
 =?iso-8859-1?Q?qZWIWMx++9EW1vXJbZgVFkSk45z8sXfZNZM4Bf+O0T3I6X3AXYluYfKpnj?=
 =?iso-8859-1?Q?8Y4dOfRnSetRd0Q60C5QsekxcdhPsgq9dw+DaxzLmVxhNL6Q+u5c7C40x5?=
 =?iso-8859-1?Q?5Uqk0z0KmFSGlcxIj25kgMEp4/yubH9wr80/TYbfxCtY9cmXM8+2hhNq1t?=
 =?iso-8859-1?Q?pLVv2XAaSiq9wq+yG+2R7QJ5g7cW2BoxFPgzX0tAlyoJTQCvK9SF8cjoVE?=
 =?iso-8859-1?Q?/Ko71hyelSc9xT/xfkGgPXiHyvIqvOATOMp0ek5SwPsefpxGktiOjSfA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb667c23-a782-4a69-0b66-08db0b763a06
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 14:51:00.9953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8odWMre2zep51lIxglkltVviagr1IkvrTTvcDHIl52j/WZpfm4z7MQ9tNK5O0DefneqhPXFNukQw3UCVo0Q5AkgoWC1XytATMYew7oMPL+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8323
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ilpo,

Thanks for the feedback.

> Subject: RE: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update=
()
>=20
> On Fri, 10 Feb 2023, Biju Das wrote:
>=20
> > Hi Geert,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH 3/3] serial: 8250_em: Add
> > > serial8250_rzv2m_reg_update()
> > >
> > > Hi Biju,
> > >
> > > On Thu, Feb 9, 2023 at 2:30 PM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > > > As per HW manual section 40.6.1, we need to perform FIFO reset +
> > > > SW reset before updating the below registers
> > > >
> > > > FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> > > > HCR0[6:5][3:2].
> > > >
> > > > This patch adds serial8250_rzv2m_reg_update() to handle it.
> > > >
> > > > DLL/DLM register can be updated only by setting LCR[7]. So the
> > > > updation of LCR[7] will perform reset for DLL/DLM register changes.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/tty/serial/8250/8250_em.c
> > > > +++ b/drivers/tty/serial/8250/8250_em.c
> > >
> > > > @@ -111,6 +156,10 @@ static int serial8250_em_probe(struct
> > > > platform_device
> > > *pdev)
> > > >         up.port.uartclk =3D clk_get_rate(priv->sclk);
> > > >
> > > >         up.port.iotype =3D UPIO_MEM32;
> > > > +
> > > > +       if (of_device_is_compatible(dev->of_node,
> > > > + "renesas,r9a09g011-
> > > uart"))
> > > > +               priv->is_rzv2m =3D true;
> > >
> > > Please add an entry to serial8250_em_dt_ids[] instead, providing a
> > > feature flag in of_device_id.data.
> >
> > OK, will add a feature flag in next version.
>=20
> > > > +
> > > >         up.port.serial_in =3D serial8250_em_serial_in;
> > > >         up.port.serial_out =3D serial8250_em_serial_out;
>=20
> AFAICT, you don't need the feature flag at all. Just provide a different
> .serial_out function for this device that handles your special registers
> (and make that handler call serial8250_em_serial_out() when the write is
> into other regs than those special ones).

Agreed. Will send V2 with this change.

Cheers,
Biju
