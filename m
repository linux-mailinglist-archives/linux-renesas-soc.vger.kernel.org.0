Return-Path: <linux-renesas-soc+bounces-19381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D32E4AFCA75
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 14:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6263B1BC3277
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 12:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C43D2D838E;
	Tue,  8 Jul 2025 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FYOOWVk7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011063.outbound.protection.outlook.com [40.107.74.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F722FF2E;
	Tue,  8 Jul 2025 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751977991; cv=fail; b=WuCvMNmHGjS6PdwxhWvG6I7s3WfKXBzjyxtYkewhIhruopXU9yrTSab1vFDPKAEG3l6mkQNavQL4t+4URZ1YHz9ssd0DLTNCBpZ3yKRq3tPRKSnIu3+039JoOyY2d2sWL2qTjk7Yvcicb9TIvXTh/wTpxJGaPbMhRKvabLSjNVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751977991; c=relaxed/simple;
	bh=c9M4UK3n4Y+pZhV17sVYP4HypQEj1IqNuJBX4mKGjm4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c0n3quLSkUW9ZwP8h41g8l3BBDJ6MzJxJt0zMzjLXAgyQO1lx/g9l9S8AAoGPg4MC2aDiWpXk8r+GmaAcQm6ccA0N16sJ0EgKkk19KeXEIs2t6ezlOyPcIa9R/RdK3CVSzVLB7IlR+v149h5WfmthV6HW4BSO+ePJxW83C5ekV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FYOOWVk7; arc=fail smtp.client-ip=40.107.74.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM3VWeuqGQ77GWNKFzYNEyoo20/7Iy3zeUGjjox+xIV5xRX65U667Wkp+qqpi/Ijmrl0BrXFRPTqTMItVZdjGPhrO3jNpWxsdDiqpm2wqKAP+CMX70I3imtUjGuDs5wQp9vgkZrFW/2A+LdEHxkyvbDJ73Qy3FwOFrSHd4BLBuN4zDA6SIeIhkkKyKEh9epmD4EbIgPK2wTE1V3YSOjXswi/u4mDKfvob3VJusDwtrZRjp++bi7bBMjZHQMMr2jRM4xeNdScjSPRev7iOOwZFDPiFdMc38Nw7+qLmfZGbgM2sTrUc78FO688pOPEktreUtj1uj6L+1zpiL4x0PyFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSlNO+13QrbePq/Uo7fZXmoTWbD1RwNJIaLLZJ74mCc=;
 b=t9/qLBn/K08+vj93XBzoSG3EJHQHzuDDfyPL4ed9d8aFhME152Rh/EOXA25JkkVtttpn6G9G5lA3dBOvAViFj3XwIUOguh1aML2/jUh2i9ZUX7rcK58KNpgO3YLOdUVOoFTJVKIlvbi4bLUk0wvPuqOd2MBhXEtclNzGo/a5ujjXS6JZBGluRyxDAdiab586citoCjf6KVCsFzr4Hd82FCvogaikD72Tn1ouyslRoO0k5GhxDttJAkTkueu67nfpGt4HSqdBptPpCl8xVdcs7VY1cIxxk2cVMPrpya79cDZk6swzMrv0qQciXulYg40fq8nM6J/GlL9fjh8Uy0LzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSlNO+13QrbePq/Uo7fZXmoTWbD1RwNJIaLLZJ74mCc=;
 b=FYOOWVk7AN2SulpFFZi1LfCcZcPZgzI6jckzSWgTEHtsT3Ap8VbMoZInTvglTqDt8h+HEe2Ax2+0z0Dl8g6H3Qve2EIi03y3CJb1TO+1qnk20OPjth542FXoTMKnzzclwhIsIh6sD9bZ53kfeXbM4lgnpYvmV8+Sb2pzuA1Flfk=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TY1PR01MB10753.jpnprd01.prod.outlook.com (2603:1096:400:322::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Tue, 8 Jul
 2025 12:33:03 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 12:32:57 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Simon Horman <horms@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Thread-Topic: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Thread-Index: AQHb7+qaUvmWH8hF00iTJeuZYkkm3rQoC54AgAAdIgA=
Date: Tue, 8 Jul 2025 12:32:57 +0000
Message-ID:
 <TY4PR01MB142822547D674B5AC63D68872824EA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-3-f91f5556617a@renesas.com>
 <20250708104740.GF452973@horms.kernel.org>
In-Reply-To: <20250708104740.GF452973@horms.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TY1PR01MB10753:EE_
x-ms-office365-filtering-correlation-id: c9e1a9c6-0e3e-496a-751e-08ddbe1b91dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?W3gJ8AHPTk8ulz+JZfDlxwKQrUErn2IJobkibnYngZJGAVzhthvH55u99m?=
 =?iso-8859-1?Q?s8aApnL25rSq8aTZ0H9MGdLifTee46sY3KfdAe/VQaBsEVi8/dNOVCye6G?=
 =?iso-8859-1?Q?T7tBMZrGQtFDulUxZhtp/Nu4Dc8NIkKHWIjIMtCn7ycBnNBAw3gncnbWPU?=
 =?iso-8859-1?Q?Ls0FzV7V7rECt0XvYtSdiLuCIMoRMFrt52Kq8tY50bk14RoDdVuum/iy9k?=
 =?iso-8859-1?Q?cU17HEEh/MqVL5RgyOMPWtpCDtbpPnJGhcGnAUDHER0U4F+oUpqDV2DOJV?=
 =?iso-8859-1?Q?SxYaahyAdH25S/ZVSxcm5knTkp3CrAj8duOQm4lMgmVGNxOqipnnOV5uxB?=
 =?iso-8859-1?Q?3YkNsrhSHo1t7HIaMxFK17R3vocJeycyTRWg8PMkqQ0rlPLzFWtkTIyhOa?=
 =?iso-8859-1?Q?BaejVZv2qn6XYxqku7Wr+vYGPqA/PvjSOgbUHRc4gn47asQSXnEBPd+8uQ?=
 =?iso-8859-1?Q?xYv1mY0eD2YtEn82iJnBh4Zb2vTPOV6dRh95HNf6nb6aCC18qE7ZBO5UMr?=
 =?iso-8859-1?Q?EO6wKAmxLTii8lqCXhLWOOLFobhVg+F8C3jYPBRxqgiUZEGYmnZAIBygLF?=
 =?iso-8859-1?Q?YIxFPw9rJwihjYx9K8BVwc2Paj8xOTlwhhkZxaYCf5KoYQ1SVAlc4+BjW/?=
 =?iso-8859-1?Q?umlcOjaf6ve1ZU5q94AaoTn5Fyt7yxdAg6dPt+xgiKxKCbRlHhm3+KFvAH?=
 =?iso-8859-1?Q?HqqS25wwfcmTmedkukQw0APtlkhznbNyjOEijMm04qx23zBb7KzJ3Z1cru?=
 =?iso-8859-1?Q?+fCVjPlCHSTFZPlgK+u9SVh5179G6tOQCb0lOZ6D+j31MJWPnAihTMmg9M?=
 =?iso-8859-1?Q?VVxNMYGUAlDyyW1E8mgg7NkhCFwVXaSX6Z4cHDzeNaqexTGtK8HnYhUTo3?=
 =?iso-8859-1?Q?vi6p7Aqux65MN18TmB/HfLME517xVOHXds5yOVBTJaa09GZnJu6fEnPLG/?=
 =?iso-8859-1?Q?fL7OCTWcb/Q+WIo7d5vGaA1c4kofeHnqTo/Zh2QzypVhRwIYISxMDtRLEO?=
 =?iso-8859-1?Q?C3WiNSDRH6dWeoYjYQ0/rkBVyE1T9JQVZyCRX3VW5W/TcWtSeWUbKRPkOX?=
 =?iso-8859-1?Q?vNwpI7Ukjvs62SzPD92gqxB2Uee2lZMx83oFa2EzWIyIjxM/F9RGoC5Hrp?=
 =?iso-8859-1?Q?newptVmSn8RtZQuiBF6QLqQEg9obL5b0dgYR6yr/gPmoW7Z+MNASwS6KjS?=
 =?iso-8859-1?Q?AOK+1Va4Ip31c/qWi03fyQPtkMgPJQsQh3HMc6ZsBO57v0y/3EoPfVmZN3?=
 =?iso-8859-1?Q?pUB1wEBCovkyXGBKh4mUKKFX+IMgBqOsOAzZYkre5JU5ux59iyLE7V8o68?=
 =?iso-8859-1?Q?NMpdjyfdZ34Q7EGa8uQ7Pi+cjksBxxDmvVziaFpa0D4H8V0ccmo9DjjsCe?=
 =?iso-8859-1?Q?JslcknxLfmogJzY60KSIJHfySrdyE6/KffZYjTCM31M7skneQLkAbXQKBd?=
 =?iso-8859-1?Q?87h8EIF6nNAayx3a8rx73fy4sH5B9MldjE7eK6lbcBvm/r+ICHFZZC55Sf?=
 =?iso-8859-1?Q?mma4vSv2T6VcTqWwxNc8WJdiAopjFuUTBUuHiB0SeR8w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DHbCQnkMLiJOwTUTQkYGfd+fy90Ezx7UUTlT1lj6yB1DuGnw76tw7pGeHu?=
 =?iso-8859-1?Q?L9EYXQQdpdpBF1Ishn2qjkp83yPj3PFDPvIyp3CW7f8sSSx8IXW4m9iBrZ?=
 =?iso-8859-1?Q?oglxOiv76Uv4Sy9RvrKnQcA7lScUJ876oeE9wN5fjpChmuR3ArFkk0cLTp?=
 =?iso-8859-1?Q?H7hXG+x1IlErH9TjnCy8KXmlgOhjlEdSXIgoOl6xPIE66rA3qJWN0OJA76?=
 =?iso-8859-1?Q?FePD+nc2MLVfIAKNycnBrVReGus0ZAaaC6BCpff1042C/Pn4qU+1MHxorj?=
 =?iso-8859-1?Q?VgXb/2n6Id/wGj8Ot44IFKQTCY/F2ZbtUkvMxDZWgK2ZHSIPQFIESlNjqo?=
 =?iso-8859-1?Q?HL3qReupWQrCqTtaYf8gtOBEFDLnPhKJWVDL9cV7YgnmtcFHe334gA5qio?=
 =?iso-8859-1?Q?6O/LKMB+9hhlrSaJ863BE7MTghb4/tglRZfXcv3Rf+u8sMVjvzuK4NNZlB?=
 =?iso-8859-1?Q?ab8Em+W8/M4CoeDqMD9YIMhURmaa/Slbi+dOo5A3UkD57hR1Y4v0YziXgc?=
 =?iso-8859-1?Q?+XcXAwTtEa0yNlLQz18nPa/Klki4D6HfjNCA9D1n4hTNClB1w9Iie+MJbu?=
 =?iso-8859-1?Q?RR6zv/ZQe1X4rYthrCGxXFeksRtYXLUXauX4SmW2/qLw8TjH+IWDwj3pCA?=
 =?iso-8859-1?Q?aoSOrW7YApPwS7bIs9pBnfh9CNgwe4sX6qJVwjAL1AS0/qENdkYTxKX3hK?=
 =?iso-8859-1?Q?647220ZMThNiN+2U44XGNHiGt1MBiiEi6xgqgK4SUBqeGTvHWXsKn6z+Tx?=
 =?iso-8859-1?Q?LwHRUYRl1PplTVYVMhUYnVlCkMVW4d8EfgAt1mzxUKH47+lj5NK6qsq4SG?=
 =?iso-8859-1?Q?/01p8Ld3Ak8CTOBI2EDIetnq8ncuRvfgNPblX2O/PNxk5CziJK4m1CfWtM?=
 =?iso-8859-1?Q?HWX8fLGusAbVaViShC9ejR82ZMh14vdq0PANrw6mg3pW/xBKZm3vTPkpaF?=
 =?iso-8859-1?Q?dZlrSGKOgPITQ3N/XH2NIB4dcNduHZ/9jU2HHxgquDeJ8uc0hSjSfpG7Ch?=
 =?iso-8859-1?Q?8FgJbHGfFJD07UESYs4z7xrnSrXRdFET56pcRScCZz6bkMlCQJPTFHccjZ?=
 =?iso-8859-1?Q?zxCQxUXtbzSCHfwK90UMzewMhBJxS0NZM+aLBXBIAbc6EgUx9BUkdcSuPw?=
 =?iso-8859-1?Q?Mzm9zyOVJBW5FdBaUC4qIO4rsymwsQ5KX6GT4GsdFRJaHPPClf0nqOxcPO?=
 =?iso-8859-1?Q?8OezPdy6FBjbBABUt4Fx8+noCtI2LTGiytPAffNVOrXh6YciF9G0EdnDJ5?=
 =?iso-8859-1?Q?pCMiR63J0KaXbJqTXA2+QhoivUa2mfpVBCOwpkvOr8157uqxuRv8uM66TF?=
 =?iso-8859-1?Q?fFnEv+Bpj6IZp1I+TJzXUQ05TNgrTbf3qEDtBjmWEj52M1qA+Nd9iqLT7u?=
 =?iso-8859-1?Q?Zj6XSNfes7NtBGyiFqRzaHwTcqr8loU036FQnwz3WJPJlXJcPlt8oj3W/Y?=
 =?iso-8859-1?Q?WOvERGJx+gMu8ztLCgI/M+Ec2lt4uw+300zLmXbGD5Vf7A4E1sorzthnSk?=
 =?iso-8859-1?Q?cwiUDcx9WISByDsQixt2zOG7H8HxCWyOQ/zKKQUmG4y+shNWcS+SZkUjKH?=
 =?iso-8859-1?Q?1QhA/eGkQlj7VBLPMl4jUpNLwnX2RreE56puWajuE//7nb4vUcLV9Z5yEZ?=
 =?iso-8859-1?Q?srXzSNg7tbSEZ2ylQGZ09deDGYyBnTiBNG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e1a9c6-0e3e-496a-751e-08ddbe1b91dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 12:32:57.6413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hXzlm1x7S7H3OA3Ib7xvk3N4s/+r61d98GFyfp1l2wHDFkouOXYhERCm8WbR/4FJ8tzpbhvrLaI+53zntoR1Cb8LBONj6oloM1LtBbqieew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10753

Hello Simon,

Thank you for your comments.

> -----Original Message-----
> From: Simon Horman <horms@kernel.org>
> Sent: Tuesday, July 8, 2025 12:48 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas S=F6derl=
und
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew L=
unn <andrew+netdev@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>=
; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.or=
g; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nik=
ita.yoush@cogentembedded.com>
> Subject: Re: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2 =
switching
>
> On Tue, Jul 08, 2025 at 11:27:39AM +0200, Michael Dege wrote:
> > This commit adds hardware offloading for L2 switching on R-Car S4.
> >
> > On S4 brdev is limited to one per-device (not per port). Reasoning is
> > that hw L2 forwarding support lacks any sort of source port based
> > filtering, which makes it unusable to offload more than one bridge
> > device. Either you allow hardware to forward destination MAC to a
> > port, or you have to send it to CPU. You can't make it forward only if
> > src and dst ports are in the same brdev.
> >
> > Signed-off-by: Michael Dege <michael.dege@renesas.com>
> > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
>
> ...
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c
> > b/drivers/net/ethernet/renesas/rswitch_l2.c
>
> ...
>
> > +static void rswitch_update_offload_brdev(struct rswitch_private *priv,
> > +                                    bool force_update_l2_offload)
> > +{
> > +   struct net_device *offload_brdev =3D NULL;
> > +   struct rswitch_device *rdev, *rdev2;
> > +
> > +   rswitch_for_all_ports(priv, rdev) {
> > +           if (!rdev->brdev)
> > +                   continue;
> > +           rswitch_for_all_ports(priv, rdev2) {
> > +                   if (rdev2 =3D=3D rdev)
> > +                           break;
> > +                   if (rdev2->brdev =3D=3D rdev->brdev) {
> > +                           offload_brdev =3D rdev->brdev;
> > +                           break;
> > +                   }
> > +           }
> > +           if (offload_brdev)
> > +                   break;
> > +   }
> > +
> > +   if (offload_brdev =3D=3D priv->offload_brdev) {
> > +           if (offload_brdev && force_update_l2_offload)
> > +                   rswitch_update_l2_offload(priv);
> > +           return;
> > +   }
> > +
> > +   if (offload_brdev && !priv->offload_brdev)
> > +           dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
> > +                   netdev_name(offload_brdev));
> > +   else if (!offload_brdev && priv->offload_brdev)
> > +           dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
> > +                   netdev_name(priv->offload_brdev));
> > +   else
> > +           dev_dbg(&priv->pdev->dev,
> > +                   "changing l2 offload from %s to %s\n",
> > +                   netdev_name(priv->offload_brdev),
> > +                   netdev_name(offload_brdev));
>
> Smatch flags a false-positive about possible NULL references by the
> netdev_name() calls on the line above.
>
> Due to the previous if statement it seems to me that cannot occur.
> But it did take me a few moments to convince myself of that.
>
> So while I don't think we should write our code to static analysis toolin=
g.
> I did play around a bit to see if I could come up with something that is =
both easier on the eyes and
> keeps Smatch happy.
>
> Perhaps it isn't easier on the eyes, but rather I'm just more familiar wi=
th the code now. But in any
> case, I'm sharing what I came up with in case it is useful. (Compile test=
ed only!).
>
>
>         if (!offload_brdev && !priv->offload_brdev)
>                 return;
>
>         if (!priv->offload_brdev)
>                 dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
>                         netdev_name(offload_brdev));
>         else if (!offload_brdev)
>                 dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
>                         netdev_name(priv->offload_brdev));
>         else if (offload_brdev !=3D priv->offload_brdev)
>                 dev_dbg(&priv->pdev->dev,
>                         "changing l2 offload from %s to %s\n",
>                         netdev_name(priv->offload_brdev),
>                         netdev_name(offload_brdev));
>         else if (!force_update_l2_offload)
>                 return;
>

I will integrate this into the code and test it.

Best regards,

Michael

> > +
> > +   priv->offload_brdev =3D offload_brdev;
> > +
> > +   rswitch_update_l2_offload(priv);
> > +}
>
> ...
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

