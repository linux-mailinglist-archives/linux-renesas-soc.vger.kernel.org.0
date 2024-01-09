Return-Path: <linux-renesas-soc+bounces-1379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99D827C99
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 02:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73E96B22DAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 01:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B81617F4;
	Tue,  9 Jan 2024 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QYVUb9LD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FD917D3;
	Tue,  9 Jan 2024 01:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0JxUmbw9wd3qBzFo6jNjiR+40i5aXn/AilPZgMK2BEJ9I2viSSbL7S13qd0wXjglY3QPhb/TOBZxOpFE2HRc8sW9nCXe6tL+8reKH1OOhlI1D25D9arvY5XUjTUXPCBsvP2xL7nmt5D4ji0zTk4dBjhP8d6voIgLhOU4oCm1rVGL+f3qg1jNG2MtIWkuLsXr7i3edFveSa6JMD6Fr+HQcZ3tmB3mrvKFDEKjUIHirc684XWZyvq8PDfEyqwGefGZfqSMf3r7/etqHWJqEmU+cCVewv+vkbFA5Uzsgr4Mxo2zLMyx7kd3MUaCNqOY8WZNX5wFhUqUz5O7Ky6zt11QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ke3g81d5RJDfquIlyjNBLRXrV5MSQsDnDQrTE2cPiw=;
 b=NZNdB2pXptXz0tSuDs769wx0NqIUTB3MoA6teNJR+urn39/HC3jfsGMauxDcwhFFwumUlfHhQUvSzUojx5lIbXj27BHlF2tei3xHzFNalkpILmzvku9+O1v1tcWNZgObfKluYq7mzYp5fP7/+TKqt7nLrZ0VE2J8BtSLbF9syBktguSSJB8N0xpzkOVGbqHAeSM+eeVUjXdDeCQ71DF1e0Gu86PRf9iiVrBiMZHb8tKGaKBV+/yRxTDtM9IddPQKGxj2OZUWvfRHFYmkjTWIjDm0oILNte3o4PV3/DDxjWPCDLPhjpRsqq3jrhygoIxzkfwnN6XklARhB69q1Wu/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ke3g81d5RJDfquIlyjNBLRXrV5MSQsDnDQrTE2cPiw=;
 b=QYVUb9LDpTgM0pPVn30nrptEuG0HpBs6lIiku6/yRTZlz0Y8HASz27Hg6NPATOB4RWQ17HVdwCoQ+qBElrEC0bNfMNuMWQXeORNBeeG6nxBXcBWenT1qgyzfuj3+FfqZ6bIaoDTlmTyj5imyfEI5Gy3kxwTl339wvD5dRnZxhFA=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB8324.jpnprd01.prod.outlook.com
 (2603:1096:604:180::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.15; Tue, 9 Jan
 2024 01:42:05 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::43bc:a2d0:a5a:9870]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::43bc:a2d0:a5a:9870%3]) with mapi id 15.20.7181.009; Tue, 9 Jan 2024
 01:42:05 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>
CC: Simon Horman <horms@kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Thread-Topic: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Thread-Index:
 AQHaPodboC5tS5xn9EWuxouQJIKuZbDImn8AgAGG2ICAAF99IIAAiwEAgAA6GoCABXVpEA==
Date: Tue, 9 Jan 2024 01:42:05 +0000
Message-ID:
 <TYBPR01MB5341C6E1C0C6EE2E0AFC5C51D86A2@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
	<20240103212822.GA48301@kernel.org>
	<8f9b5376-647a-7b59-886c-142990b8c9e4@omp.ru>
	<TYBPR01MB5341F4C4340200CABBFF5C05D8662@TYBPR01MB5341.jpnprd01.prod.outlook.com>
	<ef96eb69-636c-a91c-e7b7-46b02241ad0d@omp.ru>
 <20240105061429.45216de3@kernel.org>
In-Reply-To: <20240105061429.45216de3@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB8324:EE_
x-ms-office365-filtering-correlation-id: 76c44063-c90f-4760-bb9e-08dc10b42f73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LA0inN+bDUwGkUBg2edn2hddonsnpBSRdAS81l9MTxZzOpzFtS/WHqUqkSTlAsHyqvPCTf8S+7y/ImxMXsbJl0UfWU473b0KKWXjxjV/4ig3fh0QCbD59t7KIsT+uJXKnfjPmQmiF+x5fP46VJIvk1Ejx8ep2USwvRT0El1b0KvhLKzy6kBpI9h+Ml9u6QpFKHHfTJdrTYhVUxni6ulMoLKEvVBbC9Zh8D6iD36uHZ7eq8CUVCb36d/3eQiOQO3S5I2HXUUJIINmiK1BYB7aW0cgqao1G2tfnQCpsSPE3Gi/wqfFTvBVCh8gG58zqelvm1Jtn1G2l/kZpi3kvEoNtJjiQJl/aSTRLAztBSW0e0VzGPJLQNp0pTRyrfVw6v5fyIPRzJd+ZvT3zi9TlYYhBp7pF/jH2KaDbjav1RN/arPt/VCCthYl1ePHrhaqPHTm86whWynKmE+tMVSV+wdLtNaBSlsqmgLlYqhxcy1z1fHnHuY+qfkivVKc8kpcFLAwClWxjB6ZfymK4n1bx+hSMoWf2KHosWEZZpJpnzY+5LK1ofahiJkOUCD1sh8SWTOd3diiun/MTF0wKnvoAIK+aNV4Pot/+A+tD5K80/DIYbsDanNtiFjK44lIrm/rsnnw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6506007)(9686003)(478600001)(71200400001)(26005)(7696005)(5660300002)(316002)(41300700001)(2906002)(4744005)(64756008)(66476007)(76116006)(54906003)(4326008)(66946007)(66556008)(66446008)(110136005)(8936002)(52536014)(8676002)(38070700009)(38100700002)(122000001)(33656002)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0OupQNjRKtks42OfEDUAo6j5hwlHXFZXAkb0I2GIHNtOCBr2MtGSdwjUutDv?=
 =?us-ascii?Q?xDYD2eqdTPiP/zdIllNvRnsAzPmQE7k+o0p2b8geEzZtxBNnKW0t0Kpl36h5?=
 =?us-ascii?Q?YLBvH7ELOzTsmQaPeD+MiyXiUzgXusQujLU9I8FtDIlB68WoiHkND6n9ukRh?=
 =?us-ascii?Q?bb45Gf2qwDCbFkmzJeTIw5/cGBEcrVCYd5TBhJ3QROGUOQNF/bMR+ZtGMY+H?=
 =?us-ascii?Q?lwtlkiI/fOdgTQA/s756T26m5831xZ3gVbDSdF5oqbgPKpbG7bPQlD5to6RN?=
 =?us-ascii?Q?0Ul/Ek/zwOD7CcbqJKyysn4hL12XhnxV18dWsqzSagvm+QoCvoy8sizmuzir?=
 =?us-ascii?Q?mYmjlk3pI2Ob/s54IdZHVpUfYxRvN99MVzr2VXSVHP3g+CWSydM9i8uyApn5?=
 =?us-ascii?Q?YDRzWTU0CTyFfr/CGskRbwOoUyEe9wKWcChus0u1crpJKfCkEiYhFtw1CQii?=
 =?us-ascii?Q?nm0WWsIBnkg7XRtSGMqX4ViodkJm7XQkp2HBIRvMkyQCER3sMMDxj5iV6JXn?=
 =?us-ascii?Q?Q2x96E4x7LD9tLHbOC9jRiMVNfoWvYrAICqd+gweZL0kkaP6qUmPp+qqqhsU?=
 =?us-ascii?Q?e7wn6FznOk62vv0s4gMzeyTov6wihvpvz9k+XIEagSt4vJZISlOIySdP4inh?=
 =?us-ascii?Q?zJMF0KWQDdeK+P+V/qRHGkd24M2QktgtJzLaM75btUDjH/5Kcwbxh4zBh7sw?=
 =?us-ascii?Q?XuKq0In9V5vzCWQGTWNi1p2YUBrAPoq4NGHlrMvPhEFwrR5RQZ1iKZujMunC?=
 =?us-ascii?Q?9q2BOc3rXHY/58viAT4+8CgELplwbwECTw/8sZFPLzkBxfDL5mngcHlOLqfT?=
 =?us-ascii?Q?yHh2yUP7CNnEsX2LZ764S5j6tv8uWP5H/k23QvTJ5eDCMeUCr8o+OgNC1Tew?=
 =?us-ascii?Q?62D89qhl9VqHVtygNlYvbrW9aOTCRlswFYELGXHPQedAdSKfPwM4jFsmhrCZ?=
 =?us-ascii?Q?/O6p78cfJxCELQGYdKQ1CPwwfsGTtFfaVxs6M94a2Ol8aQU6d9S5D9Cv1AYr?=
 =?us-ascii?Q?vzn5Jb/r5du3LIjhCoM0xaQbJivczYWU62MhzRhsk4KDv5voS7RuqkwapIQc?=
 =?us-ascii?Q?u9IlXH1whYASxO/sgqYahePA5DBgzAohat+KiHIHM9c8ZWQ2EJGG+T7N/GOQ?=
 =?us-ascii?Q?+U/xwDnftjkmAXUchFszIAwh9RJnLCVQWTK8CzqbEbdkbx4FixABhZZcMcTM?=
 =?us-ascii?Q?t8+NAxQRsDIvkVoAinCizklaxp9mvI76IJ8ZKoHpVJC6hqsJDHVbQuYxN3Fs?=
 =?us-ascii?Q?Dh8ygREHYpQ7Xg5Act5il0h0h7qAgP45yeTcrwvRstyiy/gIYrMAr4iEJxo2?=
 =?us-ascii?Q?+xNlybOrP09S3yZu4kE78nCEUss26Ifwk+XkjaRLBiI882RfVx5qbpTT2dmM?=
 =?us-ascii?Q?9GxZxAscZz+WAgd7QxLIHlnzhrMynxbIWSdHPboi+FkaDUTyv7VNGA5AHzpu?=
 =?us-ascii?Q?U8yB8EyeTGyeG6u9aFmdXymmigWs58q5m/HHHNDD3HCQzwGGSz8VfL33rOAw?=
 =?us-ascii?Q?joqzSvRsBfCcWVhKXuGuT6zhpAlIL85gXpqGuClloIxMnIqLu9zWlTKdiQy4?=
 =?us-ascii?Q?nlyfsdGd6DCJfXRSYSlaSqhQ+aTilIQV99r+B8E1aTVmkjpdNV+2v8FClON4?=
 =?us-ascii?Q?SQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c44063-c90f-4760-bb9e-08dc10b42f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 01:42:05.5673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6/T9QfQmDJ53TEh/Z/wB/BeUHvsa2jF7VFS7FChIWlf8j80YMGv5czeuwVhFYv1C1NkSDr8xO9dscjPCZ95PUu5YqoVKcUp96Ut/Om1ISk4YHZbnZtefFdxpi1wBDsj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8324

Hello Jakub, Sergey,

> From: Jakub Kicinski, Sent: Friday, January 5, 2024 11:14 PM
>=20
> On Fri, 5 Jan 2024 13:46:32 +0300 Sergey Shtylyov wrote:
> > > - RENESAS ETHERNET SWITCH DRIVER : For rswitch
> >
> >    No, this seems too much for these poor little couple files. :-)
> > Listing them in each new MAINTAINERS entry should achieve the same
> > goal and seems a biut cleaner...
>=20
> +1, FWIW, you can add them to both or neither. Series purely changing
> the Makefile / Kconfig are very rare.

I see. It's a nice idea.

Best regards,
Yoshihiro Shimoda


