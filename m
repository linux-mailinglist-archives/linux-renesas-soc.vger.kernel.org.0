Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A7D4567E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 03:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbhKSCRq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 21:17:46 -0500
Received: from mail-os0jpn01on2111.outbound.protection.outlook.com ([40.107.113.111]:35970
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229830AbhKSCRp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 21:17:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMMOQ6yisLOXPS0aG2Wz/ESfcjpibHbte9CETiBt02seEH7aiYYu62jlZ9+P+4iH3RqUy7XiMguIQzk2BfLvr5JpSJE/aYLqj1UPuB/7JnaHYFHzngo1QC8A9zi91M96+0ffQNUI9+E8s7sdZTiwgU9QMzSZN0Kbq9MG7ezKHJtND6LICv3uJcda9XYlZA5bt/GWuQC0tXL75dDlhDV3dp8dTDN/04t57/FwJ/hVBjU06ov7eQlQTj3Fj3I+kZDOTF0m7dJXD/uvQAvvqOGELnUQJUPe9YKPrKOdGm4njps5cUhW1rvbPYXSFt8HWdmZ+ZRsLeRKjVwqzbfHxuiskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yZ5XA7euknQ1xO7EwQ/X+scv9zw5q1+afelY2F2E48=;
 b=P/FE1P/DDZElvvMRfXWx9v8Un3v8XuCi/fqIt06Qi3Uf1IjU1syXwjO5Cwa/6HeGRV31dQ8CiawY2UY62Y5XuqIG9G4c1Iotl29GDO34Dh7NnRDmZQHPxjr6j+PYUt6REsNCihVKhArt4Xi5+oChaQDYFP7RNyJKV0f5IWbhfpYvE702o/UQWqvMzFvWoIbsYQy03IExidnE9AxGTT+M1doi5sOYBFW0dob/y9wRS0+9/NkogeqEovwiqtL36RBYrIqlLV/237yaXf7ICMkF7qJ/bHlUiB4zw0zXn1ju8HZroS6y0mol1QjfMbsbdZncYSoBuTOqidT3PyGT6HkDhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yZ5XA7euknQ1xO7EwQ/X+scv9zw5q1+afelY2F2E48=;
 b=JMHCr+Y2tZbiCZXmVfmUj/6fopcK92PTp1dzap9WABz+YGCBtVay/XQN6b51RDkY7QZkC3uZmL34mQIP4DCoYYMUy4aDtL337tH37hvjHmcn2M4x+6NX6AS2zjZEWGau/CCLrIKTgfBlInicUlDrvRJ75HeMBG/9h1irAjUqZzo=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYYPR01MB6911.jpnprd01.prod.outlook.com (2603:1096:400:d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 02:14:42 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 02:14:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 02/16] dt-bindings: arm: renesas: Document Renesas Spider
 boards
Thread-Topic: [PATCH 02/16] dt-bindings: arm: renesas: Document Renesas Spider
 boards
Thread-Index: AQHX2r2H6ti4Kpv0IUG4c5XK55lyiawJlQeAgACLCRA=
Date:   Fri, 19 Nov 2021 02:14:41 +0000
Message-ID: <TY2PR01MB36926B3538CA179890C662DDD89C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUK5gaBh0O5kmOpB+YN6S6OsLSC_J_KmmSMxRTtu6LPNg@mail.gmail.com>
In-Reply-To: <CAMuHMdUK5gaBh0O5kmOpB+YN6S6OsLSC_J_KmmSMxRTtu6LPNg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 637fc1bb-b1bc-4079-d354-08d9ab0258de
x-ms-traffictypediagnostic: TYYPR01MB6911:
x-microsoft-antispam-prvs: <TYYPR01MB69118B36F74C84DB5AFA7078D89C9@TYYPR01MB6911.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /1ZCLj9V3+y/SR90oTwQ+fyVuyy+Y65yz4zPuDRIsKxa27CLmCG6MT4tlCav3vuoHygzYAQnOw7aPXVl0B3KSg7wucS2xs7g1qoPSrfd9/t+iNYxbUzM4wKxpv1TVk8kS009g1X8SXtMuT6MIEXsdFZiNJ0vE282z8dXKaVbAgoO4VJa5TnzLiFQyuBtZPysIXW66LTXqh6UtigMQMGJPphJ+lf+dQfC8wPM+jngBp8ujlwO3XuI9lfmF5BG7CpANtcd9bnDGaSZH8Y1fV4LC7FZ16tmI34bgXH8hxunPyqpQv8Xqqteyv+T+qvo9ojcPi62cLAZ5ev6QNegeVnIDbICmmOqLpvyEeyK0ECzBkmUM80ypv3N2aXpU9JEdsVoNSbAic4Yt0JjM8OGALUl/0GBNN8ItqfPFoydLtcUJd76YeqFsC1aQHZA1HhflStgizRP0MIVuC7jVu74WfjIoph7w5bHQf/3AlehMk+ZmfdxRgrrd8o2B+YcYSzYgmUz7BYY9QCVP6Tlv5NteNj9hlLldRQXh736dim50/VR6aeuYD7wwH9/J32YGF6TGiAbQK/O2c5rQb6ufMh5qZHVmeC5WehPAR4riomocwIrkwWamkeK/uM/HBnj4Puod+myE/lneYzBRWsgf1CGYA5MYnDnJ2D1tcXCWXm99GHqW5T/4eoyZ63oG1jHekwY+PPtvGUNWtmDPV6suZgHvYz57Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(76116006)(186003)(316002)(7696005)(26005)(52536014)(8676002)(66946007)(508600001)(5660300002)(53546011)(66446008)(64756008)(66476007)(8936002)(55016002)(86362001)(66556008)(6916009)(122000001)(6506007)(71200400001)(4326008)(2906002)(54906003)(33656002)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kbscBR14jEREHKyrWA5iHIDkTZd2P5ajwkpSdGugo2LV4wtjvTXRj+2hHVX1?=
 =?us-ascii?Q?t0rzsrSiiesr5Ob+TkJLNbcqfXjcWnoM9hF8M7/sB0fcJlXtNOQT/0gatME7?=
 =?us-ascii?Q?ZVF91JjgmEFkxTF1hkao0OpgzA0HORne59M967aL3OmlIVQuyj5MHvBFovHs?=
 =?us-ascii?Q?GJnFFR7+6A/oT21odPrbs7kGee+znMyFPMgE1+GJmD5/7/S6771NAeWYna6I?=
 =?us-ascii?Q?wKbMt/0zIHGOs78KxrZO6Ctu2X0Tu2cjD9fvR/433ivx7qK1rT1sAATt98/W?=
 =?us-ascii?Q?Sq1z7fY6zO2LWJQvDe0PzCa0J4xdWCrJE5UZrbX/Eiws8UE/tQyIpWfI1dZd?=
 =?us-ascii?Q?YURcXhA7aqI9LrSExN/BYCv+CeTZ76eOXjXuRGQNUGuq3WyO+F9GrOac6+JS?=
 =?us-ascii?Q?e4E6ZVRUOrHRSRd9JbWG8z25iGwtOJs04P/epSb4uYsWIztS3VA33EZMfv+S?=
 =?us-ascii?Q?6lgabEzGADizwmtSQ9KJWya2cU3kFGwB/aIn2NUNmzuuRuQETXKpTiIKzkPR?=
 =?us-ascii?Q?sK0qeSEBpwZZoK5dFKF7k9TDHKmd6EnA5p3e1HayntjpR/KiATOOJMzZ/iVd?=
 =?us-ascii?Q?ethUSajwPanZ6GTyN2SC6gvoiQ+MXy+ENmTZX4UIpTUpAm1qNyt/dFMfLK9K?=
 =?us-ascii?Q?NwEGcMx5ylXDjpfhoGrmaGWpun/Q9cBVtB5ByXvG5Fpkl0/eEElXLhhTpH9+?=
 =?us-ascii?Q?JJ5eWHcNaljeCPaTYXGdmPX7kTjSQLuKqmVjNj4+sl8tI610SY8sKO9WGfw7?=
 =?us-ascii?Q?X7tDQzaSiHKaD9ku+sLn8Rd5MLw9+5vYCNrxLPX23Hp2gzG/uqXgxZn1eEov?=
 =?us-ascii?Q?gYp9pOJxjrYrRQWcRoV/F6eK5wMCbGf5bUmJ7hqEP/MpvndKe0r27Yy5c9Bo?=
 =?us-ascii?Q?QVdh2yLRn9SNk5STf6yk5lO4IeweIeapyNlEnAEWRe/PewwO1D7icGsesLSk?=
 =?us-ascii?Q?qFxmn1DI6qGzmOWFQwMdcsmLjeFbuWlD7/FI2NLTotsdnkqVsEowM+cEy5YM?=
 =?us-ascii?Q?uahk975h8X0sIr7qKrh5dhXGZRm9UnYhN5HpQEvqLrKay0Ghi3pbam/u07QX?=
 =?us-ascii?Q?8crtJKC95/00CzQvzqIsYrPnrJGTQ32dBudZy582q/HnelBWxqsNLRBovGt2?=
 =?us-ascii?Q?gmYHQlmkuMumuKtp+Vh79mB4kOvBPcotZmvy/bB9g59CZYk1Ot+aOa+ovHEU?=
 =?us-ascii?Q?22DEFCiILRuFlHkWZb4nGH+OmKXaZNs6kmjamwyWX+3UMz6AsyvAULCrHC8U?=
 =?us-ascii?Q?F+j8qjk+EDlcJ67GutEq3Y8T+FUxAgwvU+V/Ea+OquYzhl1AxBsWuQN8TDfn?=
 =?us-ascii?Q?NEekPyrRhbSed4OIy4PkD5DpUlmtZ9GM1dhA5fTJwNvXzKG+URH01w0YHYfd?=
 =?us-ascii?Q?itReBglSdZcsAn0w1dohpS+9R5xPgD0oHcZXvR4CdwYLn9F/8PvpXzR3k5eq?=
 =?us-ascii?Q?U8K3BIM9KApg9reCTdB0B/vVV2SSsONkyBU4+0BQ24tG42edwLcCpJoLV3fI?=
 =?us-ascii?Q?RhQEhrypVOSD7OUTlYr4vqeQ+Y4ouQ8OUW4AMuMs+Tl9DChldohi65dyDGeq?=
 =?us-ascii?Q?00RBM56++fHP6U4/oYDEhd2GiE4hosK2OYJ5f0BWFW2o3ks2MRy+zPB1RVpT?=
 =?us-ascii?Q?iI2KQLubR+jcx5G5sOUsu+BUwS5Ad6mg7pjFpNYFJ0qPRBrlYABsXZ5zhkaA?=
 =?us-ascii?Q?2nvXcvfGPqjNLDD06ZyvSV/agGPhHcMzdgpPxxpm0/6KhsTR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637fc1bb-b1bc-4079-d354-08d9ab0258de
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 02:14:41.7439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRJyVC851hdONop52BHShM7lDha06XP22UQRj55BKUUF3X9q7313VASlPoZBhDjL8ZsEkC2M0+AvfajqfohVHLKrdqcjQBfa3E8k4/LADyGV0WjYRQNCoFDXxyWZVZWl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6911
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thank you for your review!

> From: Geert Uytterhoeven, Sent: Friday, November 19, 2021 2:54 AM
>=20
> On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Add device tree bindings documentation for Renesas R-Car S4-8
> > Spider CPU and BreakOut boards.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -317,6 +317,14 @@ properties:
> >
> >        - description: R-Car S4-8 (R8A779F0)
> >          items:
> > +          - enum:
> > +              - renesas,spider-cpu # Spider CPU board (RTP8A779FASKB0S=
C2S)

I realized that the part number should be RTP8A779F0ASKB0SC2S.
                                                   ~
I'll fix it in v2.

> > +          - const: renesas,r8a779f0
> > +
> > +        items:
>=20
> Missing "-" in front of "items:".

Oops. I'll fix it.

> > +          - enum:
> > +              - renesas,spider-breakout # Spider BreakOut board (RTP8A=
779F0ASKB0SB0S)
> > +          - const: renesas,spider-cpu
> >            - const: renesas,r8a779f0
> >
> >        - description: R-Car H3e (R8A779M0)
>=20
> The rest LGTM.
> Reading[1], I assume "RTP8A779F0ASKB0SP2S" is the part number of the
> full kit?

Yes, your assumption is correct.

Best regards,
Yoshihiro Shimoda

