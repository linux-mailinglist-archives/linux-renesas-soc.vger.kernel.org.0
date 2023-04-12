Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9F36DEC1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Apr 2023 08:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjDLGwu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Apr 2023 02:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjDLGwt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Apr 2023 02:52:49 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785EFE4;
        Tue, 11 Apr 2023 23:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNO5NZUDw5up3CC0aSG12F5HHFjMySPP8lZ0M5j4+0dpLttzJgsGG8kkjC7VD9i+DA8n5EflJDQo0UPY+N1zTcRewzwIoLjv8kI5tcaB82qKYMJfEJFSQuoWEnt52rCny2GIEQbEm/cBnDL+bcg9L6rLr0hn87gSjAijcf6/LlRnmLEHZyGd09+Y6+GPhyJEV7Ejld1jrfrNLuUHOODXE5BhJI9Gt59GsHFOczMhM9R/vbCSgJO1+siCo+7oaJbTlxt7PvNDzrbksIuqSUDIQPzUosol/p+kIacztiCORcrHXBKZR8dIhr4m2QX3CWAG5gNOsHS0UU80AhWJbssmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RnzTLmfs5HEZgjwYlHPb5eIIh2VAp+G86nIstWkRTs=;
 b=Jxomxy4EcvMcXXuBzSckjnJOFbRXcdKnOcHH0pzRn9hlt5MbUXHSHdoOdwFg2v0bFI07CZ7/KaFYA6CZDhayV9C4YIoii2rbMfzjvybDA1UGHM9PDZLt2JeZ4H1DgsEnlIRathKHfedyR2ou2XlWwMzJNzqM4oJcjpJza043ip/164uqJAtHAMWn06X4aDeQzovXqLJwA+E/K0gxWQpXagkL3Qqob718dUX/7YqMqOAhyqm8grFhhy98JvajlRJHMcNbB4K4qfZ21hRP6NBgbmcWgSniI3B5dmTyGTqre33nbCg2HU3Wr/9q6zX1B9am1IvO31sYJU7t364xST42qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RnzTLmfs5HEZgjwYlHPb5eIIh2VAp+G86nIstWkRTs=;
 b=QrvK59YdcGD7sPtnng63Cdp270WVLp3Ow8aa+UkkpxKLFKxPinsb6x1IinNlEiazg1uafYa5X+013nx4tIAueVQ2ffyDl6OwNaDQ11GIQsyysBZirDsW0AE9XMoFS6OQ+go8aIR0/xX8FV18Y8UeI9FJgrOUr0vC615L9GsnNEA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9599.jpnprd01.prod.outlook.com (2603:1096:604:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Wed, 12 Apr
 2023 06:52:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6298.029; Wed, 12 Apr 2023
 06:52:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Jiri Slaby <jslaby@suse.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, stable <stable@kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZbF2mA9ahXV82QUyTHfzm1I9HqK8mJzOAgAABW7CAAAUhkIAABTuAgAAJvXCAAP0egIAAA40g
Date:   Wed, 12 Apr 2023 06:52:42 +0000
Message-ID: <OS0PR01MB5922FD49A07679D8FCABE14E869B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230411100859.305617-1-biju.das.jz@bp.renesas.com>
 <2023041129-skeleton-nursery-f9b0@gregkh>
 <OS0PR01MB59225DFD2073B3A6C8249104869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D9E0C52F5413046CAFB869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <2023041158-crisped-obtrusive-2309@gregkh>
 <TYCPR01MB5933C7188612037F0787A5E3869A9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <2023041214-epidural-overrate-3b81@gregkh>
In-Reply-To: <2023041214-epidural-overrate-3b81@gregkh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB9599:EE_
x-ms-office365-filtering-correlation-id: 7ca32ac3-7ea5-4d8d-163c-08db3b22837f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +EUNYzeRwp6hPYIbGbm6/76PivmxNyst/05V7nj4iI8Ei77UNhVk+DRPMHEcgCEoK5GCqd116Nnu4dBBuIa13tbZfCCusI0KWSmYrzF2dnsBlLAEpmDQuTQ9dGVdpV2sB5jb6xV8QR/cqujctMh/pJX3TJZ0cLRm+ET5gKC89xAI1LudIF/mmZ0vzwnVI3TnCLMxTGNi+AaM5LnJrqZmwgORcfi/L9Sulj114KQNTcFZknhtGIXOcwFIilpYD52p4VUFs4GNbRCHVunH/XE6LDHO6oIGfl3uW9bOHyqXSF/lXVGftaF1RCaoAVvdm7/v7LRQAqsNKbwSJr2HzsNLVzhZqP/P8+dMn1lR8RFpfFrdJ/JlLiHkK4BV58FIfVUwk3K8D7AMnVGD+VWbjLBw6ArnmvVH724/A0iJefOgDnw+d6twEQfNq0MUCH98CA+Rp/CzrMuQujEWQs2CAyTMiOULBT0ifsnxW8ZMpC4Dekaon2GSBhDTZnyfs4vJtnqXFBekpv68AaK3lgYTpPd8g8ag8SKOYHBbSnEBOvdkErpH5fioOYe/M5prCSYR0MSxVizvu+oObTCgsTPV1xj2wrLJ5gzGd3u7l05ble7CsBIjJ9KDqHSmchAjoyHgSiIl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(86362001)(186003)(33656002)(4326008)(6916009)(55016003)(41300700001)(66446008)(64756008)(9686003)(316002)(6506007)(26005)(7696005)(71200400001)(83380400001)(478600001)(38070700005)(38100700002)(8936002)(8676002)(2906002)(66946007)(66556008)(66476007)(76116006)(122000001)(52536014)(54906003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sRUI0t/hPTOCL8gFXB6SpjNYBZWsXeEspac5npw4cFEJLX+qCSsEMkzth7?=
 =?iso-8859-1?Q?+mCVEAGv8RDTYhrW6Aik7Hs/M3mGRHokx+5OI29fkgy/yL13QJcZ0FcQsl?=
 =?iso-8859-1?Q?fN6uhPQtdr7aNXbNffwpE1VqWOOHLRk6sH1dNohFtvQeqz2dNyOpB69F1s?=
 =?iso-8859-1?Q?LLOTHpdJxdca64SH0QGBVXzFqClQAHpO/+TJDTTkx/aGJn+cPGILmOg96Y?=
 =?iso-8859-1?Q?L3w+/bgCwusNn+YePMhc106ysgcZ9hCwcAOd264WPTLxRmUg1b0HS/As+r?=
 =?iso-8859-1?Q?dVoP8KS1YchEv/ijcBtyUp8fJSQiYv1ZQ/3r3j4mwVlovO0Y6XuPAzjd2H?=
 =?iso-8859-1?Q?FBdtX02WKl5Ewcql6n74k6Z70gUEpu3LUB3lWrJcF3a0k5KJsyXCd9U1kH?=
 =?iso-8859-1?Q?vTGKQohgHrACMV3+OH/ezSh9geWntiYP/34S7fV81QvVuWHujIlOcv36TU?=
 =?iso-8859-1?Q?+TCWwQU6HPWy0rYNJ9OsPOigiGpTVDdqSpuBn18MwT34ik6SprsHVzdWYm?=
 =?iso-8859-1?Q?J2hG0rD2fwZrCot4tRzHGZ5y1saK5WqqfUyoqPPN6fT7MYoyQCor9nkaXJ?=
 =?iso-8859-1?Q?pGyMLAus6TwN8WhCk2mRr+hSxkxASURMw5hoyq7FmES8To7t0zfDylJxPj?=
 =?iso-8859-1?Q?NCGpslJGczexQkAZRMJpPhM4BJfGQNPxY7ulDuU+YwxT3PySOHzvE2Vvkh?=
 =?iso-8859-1?Q?f/iKtcMkzDmpzNDo+XKqv84cT6Vw63QTCxpt3e6M21wPVbgBJDE4HOYfrR?=
 =?iso-8859-1?Q?DuLkUzxy17rQ66lGKNT/1i1TeFQ0QRfjh+SIiBSkhqbgwznaJj8p0NkVcA?=
 =?iso-8859-1?Q?S/I3hVI5j783cATn3gprfrzzwjAgiGbABbCQHKUbRosEpyQ/i4WlzO1JNC?=
 =?iso-8859-1?Q?mhgyDFiKlB93yKD7RqOOsJIMxOGJ30/zmFhLwTG9Rdj9Lj9B7ex47DYILt?=
 =?iso-8859-1?Q?F9jANkVl9mDuMD2qqYRjJD00zua36BaIwGkie0xuNDmBls5HuU0mcwlLc2?=
 =?iso-8859-1?Q?dcoQKk4XONazuKcwtZS0bn+G/Z0MH/Dj0cdulk7ifddsa6wAHRcxK7lqns?=
 =?iso-8859-1?Q?n5hOhijZxvPVjK3PJs8VZkxSTQVEvkL66nJ0fXW388kXAZsk23MPQh7vY5?=
 =?iso-8859-1?Q?lLnDmK1gyDlF1+CfUbSS6CUSQdH2/AWUyXUIcfDMvBTc3A50R2nfHyv2FG?=
 =?iso-8859-1?Q?EiGCYZQ5IWqYGIbbAJdfjR77B9DxiPrRGAeOV7R6vDO2H1smwLvA31eQPg?=
 =?iso-8859-1?Q?pR2n5QaXE2FhXEXwWMlfGtWiiz18ymqAXGLipucEeITfLaui3NYpRrtpz6?=
 =?iso-8859-1?Q?v/Jvjry1O9Y7/nX8qLS0uEShsXUufUkiRtOyt2HQQJ+ocpi59Ud0qAd1vo?=
 =?iso-8859-1?Q?UNn1+A6bUs62eHDgiyeDzuSi8iPADlN7YJOT5KOZpHh7i8+z6ZacidWkII?=
 =?iso-8859-1?Q?VpsrdNH/JO2ti7YNijKIA/PdM10JKpeephj6M9XUA0pFqOdAHHfWBxAzby?=
 =?iso-8859-1?Q?g1bwM+GE6urEZDGCcjQ8UThBsJorfTpiFKD1/62BPQevRHdcotXtACglQk?=
 =?iso-8859-1?Q?kZnuE3p28x5xeG86wfOL+hVY9qdPkywFpuwus0mShgMJlT5jWrfhs1ADLJ?=
 =?iso-8859-1?Q?Tz92ATxjalUKpgfTBE2cBnam9smPHeA7Gj?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca32ac3-7ea5-4d8d-163c-08db3b22837f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 06:52:42.3784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sl8vVXBN5Q7w031hSgq1REb5nVDOVnF+jE4MeGSrYf+U0ey2xxQTiOKWSvS4OV4vzSKx05YYhU1caOZ+W5Nt4n7Q9v5/gPDk6kgOcBbN2ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9599
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt hand=
ler
>=20
> On Tue, Apr 11, 2023 at 03:36:04PM +0000, Biju Das wrote:
> >
> > Hi Greg,
> >
> > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > > handler
> > >
> > > On Tue, Apr 11, 2023 at 02:40:52PM +0000, Biju Das wrote:
> > > > Hi Greg,
> > > >
> > > > > Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > interrupt handler
> > > > >
> > > > > Hi Greg,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > > interrupt handler
> > > > > >
> > > > > > On Tue, Apr 11, 2023 at 11:08:59AM +0100, Biju Das wrote:
> > > > > > > commit b43a18647f03c87e77d50d6fe74904b61b96323e upstream.
> > > > > > >
> > > > > > > The fourth interrupt on SCI port is transmit end interrupt
> > > > > > > compared to the break interrupt on other port types. So,
> > > > > > > shuffle the interrupts to fix the transmit end interrupt
> handler.
> > > > > > >
> > > > > > > Fixes: e1d0be616186 ("sh-sci: Add h8300 SCI")
> > > > > > > Cc: stable <stable@kernel.org>
> > > > > > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > Link:
> > > > > > > Signed-off-by: Greg Kroah-Hartman
> > > > > > > <gregkh@linuxfoundation.org>
> > > > > > > [biju: manually fixed the conflicts]
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > ---
> > > > > > > Resending to 4.14 with confilcts [1] fixed.
> > > > > > > [1]
> > > > > >
> > > > > > You did not actually build your patch, as it breaks the build
> > > > > > :(
> > > > >
> > > > > Actually, I build the patch, but did not test it on target as I
> > > > > don't have the platform to test it.
> > > > >
> > > > > I got some issues while building modules which is unrelated to
> > > > > this
> > > change.
> > > > >
> > > > > Anyway, I will double check again and confirm.
> > > >
> > > > I confirm, there is an issue with this patch.
> > > >
> > > > I disabled building modules from my build script and it showed the
> > > > below
> > > error.
> > > > So I would like to drop this patch for 4.14 as this header file
> > > > does not
> > > exist for 4.14.
> > > >
> > > > drivers/tty/serial/sh-sci.c:40:10: fatal error: linux/minmax.h: No
> > > > such
> > > file or directory
> > > >    40 | #include <linux/minmax.h>
> > > >       |          ^~~~~~~~~~~~~~~~
> > >
> > > Yes, minmax is not there, but the function needed by that is there
> > > (hint, I had to remove that include in 4.19).  Remove it and see the
> > > next error you get :)
> > >
> >
> > OK got it, The SCIx_TEI_IRQ  is introduced after 4.18 by patch [1].
> >
> > [1]
> >
> > So, 4.14 does not require this patch, as it have combined interrupt.
>=20
> Great, thanks for checking, it turns out that the Fixes: tag was wrong :(

I agree. It is my fault, next time I will take care this.

Cheers,
Biju
