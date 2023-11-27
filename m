Return-Path: <linux-renesas-soc+bounces-302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE407FAEB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 00:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70F8BB2106D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 23:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A60249F7C;
	Mon, 27 Nov 2023 23:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PoJyPIsq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E37E4;
	Mon, 27 Nov 2023 15:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brq5E5nJ2vFMjI016r/4ThN9UhOouI7tQLzpj6+IjO8wGlVVytRS4NN/p5Q3ceH1In3hbhASSP8roviVqcncobGrh+w1zgXIi2Ot3E8dkizPk6nAE6pQFXClfGI1zsD+jbaJkDqWMX8qDnKcCJXjBEnzR9lJxrdmpOK2BIORWqWE+3d6xsRdE+Y2j1vZMO57iLTkj9boJ3yoax4h06uC5vBi++LLfC6aTXxnQmUBOT5Q/AZpKLEqAaj0fSXMYz3U6FersVaw5Ky+fv8fnf+JDboz5RovqCoVACSd3eRQtcT516oH2/SWx+svdlYTMtZ3sBzGuEGP6oUFXOuuclhABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl3U6x2KdnWNHvv6BEj6VBQNVgtaIOeA8oJySdvJ73Y=;
 b=CSnykAm0TCQg6pNGAurJKMjxzKbUuwHJZXwVrOeYb4l+SHnWHGH9D3M29sBqjCwc8rDst1SxSRvneyCkx6YMLGxr62rd5gdHd+PNDEFG6WTAHiyxvUm34YHqUXNA3R2SHJ2fCeE/T0D1HebveCboxcD6WrzJNz70VTPrIW13iQWbpef+o+wiW2mnZa9JeZRWVQyPCtV/zFtSMMjioEOaqkzLmXjTkzbJWn+e95zv0GdGZSX7n7yzcUQHA4duvwGCg/C9nCp180zih0Dl0AKAdGUjsyAzhLvdT2EI2+BnkpT4TBdU8tx0cKO0k3xZKmBcKjeulWZhvDwes4hq8E+JWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl3U6x2KdnWNHvv6BEj6VBQNVgtaIOeA8oJySdvJ73Y=;
 b=PoJyPIsqMVG/ZlRIg2eGrKCPHNfhOZ53ph0NokNzmQBCwScXGMKkEFjWYWTUsb0HMokUmabmjees10yXBgYBlrtLP0OlolgUq1eePh+dLLYsNhE3EMItXIwcLHlfk2/b/GfbNTyWzLgY3kyZ9OmRKUAQb9xHcN42nNjyA1Y92yc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 23:51:10 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 23:51:09 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next 0/9] net: rswitch: Add jumbo frames support
Thread-Topic: [PATCH net-next 0/9] net: rswitch: Add jumbo frames support
Thread-Index: AQHaISheVmJJBycYaky9py/Ve4s/6LCOrRqAgAApI3A=
Date: Mon, 27 Nov 2023 23:51:09 +0000
Message-ID:
 <TYBPR01MB53419BC6A2A112169FD162A5D8BDA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
 <20231127132139.796e2a16@kernel.org>
In-Reply-To: <20231127132139.796e2a16@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB8896:EE_
x-ms-office365-filtering-correlation-id: 2d58d413-3d78-4d97-d432-08dbefa3bb04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QywSGAAqP2BIQ7MybAX0j8k7kyc4x1Hvep2lESGH/pp8J9tCb7SPk5Ng99gZrTyrD63mPVcJ/VPZfR/4lekF5rz4LQVqPJx0GOBRkdYxtO+XqYQDsjCuwS0WXcnRgRWlXjinzperHFH8XKRS9OiVgD5ixO0/dgPGloBjjmvRORqElnV9ESEoeZIqpOB/1OLwK5XPBfMnrgVY5T1epEx8sI051vjLUkxQiO4z3BUiDDBfn7/maQiaskxrgnQsVcahMgiJQ/lSRlurBkiCB0kwq1qu+Uz2y1DjeQcvwU7pRijw7SZ5l5AK7oip67Y64/5+9FUnQCAX4YaeqREm9pLwc84gyU6UGrpVtA3K0Um2IJIO687/eY7A1cCvaS8r7YRC17RghXi7idgdSd27IOgiQiLcqd8/kkMs13WHAEeiOchu+WfkPZBAtGUXzDRKY0Keow0rkYp7f4vSocJAZc8PSCSUh/NEQtHnTUrcVEPQ9wUWsfygSe1plCAP4E3sp1Q3UW+OXXkkedZq8sW2EgOHvYSfIk8xTqPZH2DAT7RxtSeDc2TkEsL2uE2cQO96tynWOgELeTPRyMuU/jSNVPKchgVQvxUsKgFr4m9LXbgKHkDld6EkhAMOdtJvkjJsNAHX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(376002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(38100700002)(41300700001)(122000001)(2906002)(55016003)(4744005)(33656002)(5660300002)(64756008)(86362001)(6506007)(8936002)(8676002)(4326008)(71200400001)(9686003)(52536014)(7696005)(478600001)(66446008)(66476007)(66946007)(66556008)(54906003)(76116006)(316002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MkQd/ujHdACNzh9R8oBeQnPgiuEi/6RtSrNypJi8A/5z51cfrjqlgFuquiBY?=
 =?us-ascii?Q?V+cBUBKmX0DKi0fg/+Sg3ny9PLjI1iEmuwJtX8nzyarXRKnDJfCo+iIu4t/q?=
 =?us-ascii?Q?iHv9IHJAzzpsEJgIYz3RbnlnSs9aox/Pne6OG+CS1gzLWPYVVV1Q28GybXvm?=
 =?us-ascii?Q?geWlRxPR6x7eXceGthBZc+mGSFThKCXTeOma/fz4hFR3JPkGWRYfabRpafoE?=
 =?us-ascii?Q?BC47yaUYuR948GTOw6Di2g/4ZpFIM3nhcALg/AoyIbBFPH95usMuO765Id1k?=
 =?us-ascii?Q?tDXdRq/4xxkQs8zX3rG26WZngsiypJ9uIWVWb7zylzHRtGSmCABGCYIGvoGy?=
 =?us-ascii?Q?rMR7mLAqB0v+ky0VCTcvHOzvQyg7aAAGhtGVE47s/A7xedu1etFT5A74fd8H?=
 =?us-ascii?Q?CHVSbhPvD0ujPK0lQp7zJse2/w0oLqPX1c5VT7M/JYJ3g0Tx+eob3u+q43w6?=
 =?us-ascii?Q?ZhVre0G4Wser1EQPsHzLzTDlJjSV2GR53ZSNWsTsXIgPuOpkt0x7UbpvUfUz?=
 =?us-ascii?Q?KMAAtWuhB07zL7R9CVfHYVLkxI/4JMZ/4AAIuD9K6cXab9dp4l4+SgvsKa6p?=
 =?us-ascii?Q?Chmb9WBiSGI7RriVfcMbZlwnBkkV9vKbV0o8hhvgpTNfOofaANoo9GA/3Tcx?=
 =?us-ascii?Q?lQA3B2o7fSRpAcog46oRBtCTmmtRHYtNs6dysG+DlgW9nkPRUrgZQOSCLePc?=
 =?us-ascii?Q?UvNeWsF/+c+db/34zxp9WqtnhdW+hgzEBT8/cQYd1Zz2rz3xTUR/14gIiGS6?=
 =?us-ascii?Q?yq0xkCgmFoNws+r1cwEXsIQyunzsMTSR+TbnGm608JYkBFx8b6eP1bc7hdCE?=
 =?us-ascii?Q?Yvj1cmeJGHSOz6xV/y0eXGPxYv0wuQKgEdNZjoVqhoan35HEMyYK2VTmUc6i?=
 =?us-ascii?Q?A96KTgEhNuH/2uduR1IE9r/nAv8Dmi8ypZbjSFvo6FYrPXToGHj7jfdsEdx1?=
 =?us-ascii?Q?jmE5KJC3YI9XmbCgy6EIADazIuE5eZxAXKJbkaG82uMil8ho8URz1kB2gklA?=
 =?us-ascii?Q?hvPFbQpLT1IcbSuJXZToRhpVZZH2g6DcnbcYMYM56YcStemTO5jM7i2FbZJi?=
 =?us-ascii?Q?bTIk2rztQDPSIQ1fouJxrwf4v2fvwPhUnMZykC0zi4flGApLvIsvSjLi+4ti?=
 =?us-ascii?Q?8TEDyJThzN2GpeuOGBt7p2xTqHIRESm6YHmfntQpHQj9vdCfkYWktMl52U6x?=
 =?us-ascii?Q?TWu0DLVUqgz7uHsL3jhtMMpPYx7lJOLJ82bIV8NnrLSSmonxnGgk8OARzx2N?=
 =?us-ascii?Q?CNeqhWOQDic6Ocijnaqei/LVr7a4R95Ejzc5bWBgtkTnKpvbDPQZ/bVs8Ok6?=
 =?us-ascii?Q?Qbm0gG/VKW+yaW+TFC0JSHfVsN1Idc9ro8obMoDx+BsfMIVUWrp/gSTDyrpk?=
 =?us-ascii?Q?/7vUTKadu2qJeD/yPSo1v860m+lukNNU6g7ynwGRNGDGssnZGpJVDYolKc9l?=
 =?us-ascii?Q?xdOZXUNzWTGIQ32rr2fPhOUNGWifq9IqO2Ab9nu73cmVMwX9ZcMGCoMFC+U5?=
 =?us-ascii?Q?AqbhGKhd12Rmv2vsvLbS3QDIv5uaNCq6rI/nrMWT82XUp97GKsjJ3izgQ96m?=
 =?us-ascii?Q?8zsZcTLZU7gvB5bUVwSSwPyt0fDFQznI1WV1mOm7/mNcCpXCzUfKc95pejF2?=
 =?us-ascii?Q?9upCaMRDL1agWPCVLn8kE+PXjGFAo7s6ZvlfLi05GHxyt4N2CGozBkzTyYwc?=
 =?us-ascii?Q?zDgtPw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d58d413-3d78-4d97-d432-08dbefa3bb04
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 23:51:09.8912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cU/6R1CxEasBR9pw+VzN4C/e7Nx59cPbVO+r/l0RAdsZcpAR9sJYYybQW8YjXk9Ghm1nQxXV/Oh9scrBlOoFQKG4QtaFfZqqSkBB5acAF3Jp21iP5svjPEji6oA9n71x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8896

> From: Jakub Kicinski, Sent: Tuesday, November 28, 2023 6:22 AM
>=20
> On Mon, 27 Nov 2023 20:53:25 +0900 Yoshihiro Shimoda wrote:
> > This patch series is based on the latest net-next.git / main branch,
> > and merged the latest net.git / main branch to avoid conflict in
> > rswitch_start_xmit().
>=20
> Sorry, you'll need to wait for the trees to converge and then repost.
> The trees are merged together every week, some time on Thursday
> afternoon (PST).

Thank you for the reply! I understood it. I'll repost after that.

Best regards,
Yoshihiro Shimoda

> --
> pw-bot: defer

