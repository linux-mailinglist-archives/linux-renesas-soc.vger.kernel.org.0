Return-Path: <linux-renesas-soc+bounces-66-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 754907F3C39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 04:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D2291C20E12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 03:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A5A5252;
	Wed, 22 Nov 2023 03:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NSLonTW6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8CB90;
	Tue, 21 Nov 2023 19:15:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKCg4Y9MbQ1jaWoztNkX/A/wCLtvBLRhGXJDSPOLaX5UX326C4vR9CBnNlGFHAMfYn5ACltT9QvarQoi2GkipWxpTrHNYxhDJIZtF5VuFX6+XeWYUaQk8aB7gOlyg4UxlALc6GqbAj7RYUS8YlETznRfeUc7ygKDL9L8V+Jjg2lA94aGrjPnzRGJdeKKVC6YwAZoUa5tDstNYp16Uvx5uCpPRHZm0+y9zvUDJUmvg87WgLZjz5rl/hMHn8DdOM6d+pIQ67v12n210Jo3mdFEnkeaOx9/qKvBcSbKDTt8jjGxeDJe+jkQfHQAaa1gGwQ2xAWOwEpRtIGLSajUR0/NcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Vc2cX32gOV5SPJBlx1gtMsUT4RqZseO7otgy+pbblE=;
 b=jbZuL19vNC+tcVY72YRzeBbYZ1A4xmZsMU8qrEdNOT0W1VxmfzYnJnWWbp+l83tjg1Td8tLlMYPCxuPIDG/kjwTqc7ZOT7ZJK8FRV27OIWM+8rsOhG3yhyuWuQpiuX/MdsU2oiu+rYAqAf+Issc9ScsdpVm79OnhbcMsY/lZ+PXezmhH4YI0Qia5qoZO4+D0KjBG0fl2KBZVXAMp4yrrhs5VRm+mUKe1Z4+8TD5FNemmt4QRoy+oGXRS94jb+KXJAX8mNGLHRDYzrQtQawmMi8pVM+6Exi6G9CZB+UEnTPHw/VsG9XLIqSaHh7hscEQ2P5gqteQ2bs6M9sff4XeJpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Vc2cX32gOV5SPJBlx1gtMsUT4RqZseO7otgy+pbblE=;
 b=NSLonTW6hpH1IsdXhQwKFVQLtKO68AitUsdbC8Py9qVrsSDjJK7Rn9ItBrKryxioLECNnTptpAg4U12bBmbNCQiy5iXq0GBNrfiCRneAnDqYqQWYqPHZ55g5PMA8UvvE30N6fpzTCp0J7p01w7wTtM9/XP6Ec2jNU6vjlc6Cv4Q=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB8124.jpnprd01.prod.outlook.com
 (2603:1096:604:164::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 03:15:48 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 03:15:48 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2 1/3] net: rswitch: Fix type of ret in
 rswitch_start_xmit()
Thread-Topic: [PATCH net v2 1/3] net: rswitch: Fix type of ret in
 rswitch_start_xmit()
Thread-Index: AQHaHOLdxdrFGxwzjkOh89YRe/jxUrCFqRyAgAABU0A=
Date: Wed, 22 Nov 2023 03:15:47 +0000
Message-ID:
 <TYBPR01MB534110E3B5BF79130F67D932D8BAA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231122012556.3645840-1-yoshihiro.shimoda.uh@renesas.com>
 <20231122012556.3645840-2-yoshihiro.shimoda.uh@renesas.com>
 <bafaaae9-3650-4c38-9d23-a54b73a56937@lunn.ch>
In-Reply-To: <bafaaae9-3650-4c38-9d23-a54b73a56937@lunn.ch>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB8124:EE_
x-ms-office365-filtering-correlation-id: be3e3f19-f3d5-4c3b-29bb-08dbeb0952d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dpFUUumXGSYwDuUxZzvXnqV2KIOLaplHzxbor8f9Nsjlu9QM6GQqnPDh155ZFllwdZ8V7D0p2yqIzmZmmtr557ZLLS52LCX6cbvMJxCFfY9gUWmnEZXemwY7jaZQHMtJjX4j/AJtIGUb19o0/hBUASIovD8FVj6GWa5i2pPeRm5TMeLs7YJQIZeKLtAFM79PuhjGHIKUaee7SDcUIKqHRHwJJGI0pPEmGx6ELIGfrBrlycuJTSLY3j0wtwDkWZWQHiJCfeUKjvpkXn40n+6LAH/gtvAnmjPUMZrFRmeJMWvremSje6zbyP1RO9Jw+rd/WzPz0UB4YPCJEeCMs9FMULU9lk1dhlCGRpfyi/6btmn2SftAj26/fX43XeYBdTt/kscD79kJ34QVQp5CIGLb8WrDcBuOaS2GTgaWLYStreSgC4ik2ukSJhNdQ/U/wXccXIumv53miWXoTeWto3QwuIUjHzSh1uCtJBydwCbzDaVVhetpybrYwpT03nLGI1KZq56pwWOfhlrAMJ7dAvrP+DOnL3AUZj0wSt4HyhT57Nxqsgjlm/3+CXffw0stz2OAUaPWf9yVn2ruP+GfZ5tT23a/UWuzrCLvHlkpb+PpAKI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(55016003)(71200400001)(26005)(9686003)(478600001)(7696005)(6506007)(122000001)(38100700002)(86362001)(8676002)(33656002)(4326008)(2906002)(64756008)(54906003)(66556008)(76116006)(83380400001)(5660300002)(66446008)(66476007)(66946007)(52536014)(41300700001)(6916009)(38070700009)(8936002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FDiPeDG0KVqUHDk3XGD3eefN79c4xNzgbZSnis9fqSjeBNdDWsSRutwH5qRw?=
 =?us-ascii?Q?GYUMnMUSOuaWvQChqePitWT86w3FT5ppU8NxjAqMkykFYKxkffjxMpmVtosx?=
 =?us-ascii?Q?I6oYaWZ1PU0nWxZIm4I7ZrM7fOamiyf0tTBaKGehqxfr1pd4saUbVK+Lw1o4?=
 =?us-ascii?Q?1Fm9k5IP7GKCpQ7qypbftgdSZn8nihTrmdfaVojwzYA0CKQHATuh3xRFqUJd?=
 =?us-ascii?Q?k/DXOdk0KGH+zIkuWANAz7NlV0IXQSMIJU3BUiBCnQNay9KbsFko2cWmLoor?=
 =?us-ascii?Q?vAL7PpMjO35httOC2FpgsTf6GixoATXEptpjz4RNaGMKcj9pJLIilESFPPXj?=
 =?us-ascii?Q?O3NGZopOHIXSRt2V5TzizeDXHl3x4CCV70aWmilRCrzdNOD0qpkFvIHMYr7y?=
 =?us-ascii?Q?jLTIKIHi5Sb6P5z+jv1IoTmOm5lfKkrCrIXFGKW99OlpKYDkCNruzEfKaEry?=
 =?us-ascii?Q?2Lhk1uycu66oItCdX/WKppsAnyo0Q7E1/c2f2kWY/qOp92nZxBmT0UxjH2VP?=
 =?us-ascii?Q?18dJ/lY5W2jY+aYvGfFwvL9261U4PQBitTu7IY99RaQ6TYRI+wpNFBlxseNr?=
 =?us-ascii?Q?b+LHMyB48G/+P4ja3NG8kr+K+ROdp15Lc5n50oTJiLDzMyNknpwD9flVp1Pr?=
 =?us-ascii?Q?T7bx+6GwVQtEXJkaLd7amQFloDzzskALqVK3urybLYBR7xQbQExzgEG9i1k9?=
 =?us-ascii?Q?ssCDt/2Qh8XYqAwno4EVRbThkGNkLB95KKKMCyOIFQ6sT0Z3JSx6fRurDnyE?=
 =?us-ascii?Q?nv+Y6pxZp4MiRzCo4JR7QxSXIoWp3+m7dFVDV4nZCCpSIZPj8y4yKGbN4TX5?=
 =?us-ascii?Q?wr66wp/q6sx2SW+mJxYWEJWoha6VQJ9IGK/H2+M8xCw4Rpa9d7gxsT7nhGZp?=
 =?us-ascii?Q?5Je6aNFnXKZTjlwgXEMmS3PiMTwTCXhmWOe5Ja41kgnHXlmJes8PooWRQjg/?=
 =?us-ascii?Q?DCFAIpLqXs9KZBVQjdNbLX4cyxAjH1l14TLDOR79eWzY1B9korknU94DPXsE?=
 =?us-ascii?Q?jG7hUgkwqsSTEd0x82dM8vBuhqNqa9kBO/R7lWTY7J383RYInr5r8BRBTm7F?=
 =?us-ascii?Q?yOsX6S7vSs9QSJD8gzGJTyFf1S7lNLNQkyng78McQeBATOqdIar+ynXcvSSo?=
 =?us-ascii?Q?0OziCvH28THmMvYWF3koG61WNa8ci9uPmUEgdnpRzFxYvQcCFYs3WOUVibWW?=
 =?us-ascii?Q?fOa0WnGJtVQdxM8rUKkfhscqWUW/ZZkR+++CknVBDF9Rmg2v8F84nzv3b6wL?=
 =?us-ascii?Q?XBxPH3KTWjAin6qVDAZH9xudFfX3swrkVGbBewqD55Mrb/r3K+XgA4BRb2e5?=
 =?us-ascii?Q?gk23S9k0a5L0x4EAZ5Eqx6e8gjGhr6nWmN9cADyEfl3EIf5CQNDQ7jW9cK0b?=
 =?us-ascii?Q?BpUiK32O2ubP0Y9v7G+W/BEvbaOGVg0CU3bWUjLEhK7c2Dj+t+18LIexYBno?=
 =?us-ascii?Q?LKoeB2GItMPGuGd+p2YUPc0nxSUQ7+Br+N27bgrVwuWsQAlwcDLDf55VrY0g?=
 =?us-ascii?Q?4ZTu36y8t+xU0W1oI/NPky+s0uca4b/ObOWMJ0z1/gBoOVkG5OPV00J+925E?=
 =?us-ascii?Q?1N4f8kZUJfP7GcAHcaL3DYh57eRyYKQm0Y+hcwpZZavw+sxZTj7tVUTjuP2F?=
 =?us-ascii?Q?6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3e3f19-f3d5-4c3b-29bb-08dbeb0952d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 03:15:47.9517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TOe+5/1VAf9ec2Am1i4Aeq8lujETOtPCIzWNS7LG9zJXyR3OO6KSXXHl3S+g/sFrjR3Y2m0qQR3Gclt8DxtAaRoDXpP8j7eK1knWuqPD9tf/RzfDEFYSwnG3avwMcRiK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8124

Hello,

> From: Andrew Lunn, Sent: Wednesday, November 22, 2023 12:10 PM
>=20
> On Wed, Nov 22, 2023 at 10:25:54AM +0900, Yoshihiro Shimoda wrote:
> > The type of ret in rswitch_start_xmit() should be netdev_tx_t. So,
> > fix it.
> >
> > Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet=
 Switch"")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/net/ethernet/renesas/rswitch.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ether=
net/renesas/rswitch.c
> > index 43a7795d6591..abaaa1112588 100644
> > --- a/drivers/net/ethernet/renesas/rswitch.c
> > +++ b/drivers/net/ethernet/renesas/rswitch.c
> > @@ -1505,7 +1505,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_b=
uff *skb, struct net_device *nd
> >  	struct rswitch_device *rdev =3D netdev_priv(ndev);
> >  	struct rswitch_gwca_queue *gq =3D rdev->tx_queue;
> >  	struct rswitch_ext_desc *desc;
> > -	int ret =3D NETDEV_TX_OK;
> > +	netdev_tx_t ret =3D NETDEV_TX_OK;
> >  	dma_addr_t dma_addr;
>=20
> To keep with reverse christmas tree, ret needs moving up a bit.

Thank you for your review! I'll fix it on v3.

Best regards,
Yoshihiro Shimoda

>    Andrew

