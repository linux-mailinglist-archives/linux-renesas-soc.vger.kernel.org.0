Return-Path: <linux-renesas-soc+bounces-27615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PWmOKyPe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:49:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61786B26A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A49F2302E84F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28E63446B7;
	Thu, 29 Jan 2026 16:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HMOaMG6b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E2344D8B;
	Thu, 29 Jan 2026 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705368; cv=fail; b=brUqLWrHyNYWMHv48IIns519PFAUbNaPN2MvrsjpFjCsZjH3tNnzoVpklizjji0ezCihI5TQbDVOCIWCxAeND0BRzYnCVg4OKrcsg4J+co2xAUV5q+ctwoBzcTANkRrWX14i4RHKGzUCBoLR/qHJiugH1HJTLMSMGoFghNM8czU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705368; c=relaxed/simple;
	bh=hgHNzMWVd/ArQxD+FL4FE/GKnkqiinfAWihIk0pjbG8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=f96TGRwRDFEXp/ajsRuMmzlAmBr6Jh2ajK6d79QfC5GUhqUuXfneJJ9bM3Wd5BKDNDBtm/B1Q73wKrJUMiTsOLEKIs9p7xKdmT69+8OJoHB/iqH7+SSyWrsxcWehdYXXzyp7c+5PDWiA4mk6PBiRnEycqb0HAO68MJaB7RZslr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HMOaMG6b; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S++G7LJn1Y+ezgMjUPQiKx4iI/A46JuFMHK6ErwLFuFMhpNxp8bMaU2ri1E8copnKqYqhcBEE7S77XrrpTGH++Foco57euTPT383h4+kJ4EYrbtdn1n4SPUyU+Hby8WX0JZ1jNQlBPIBCkAg7/DKEK9ri682ckiGv3052EYeuCRgKnwHZWFwX7H7IGlAOrpJuspgYX1wCdBr9vxNx75tBX8KnNKiq8tjdIJIFn+pVjhGW0K17Doh1xYk5+g4s5GiI5DsIlTg1rPE62oFkPxVxd9IrV+4QlwEeHgbZ64UikiXUnSJ51ZP7e4+aWtegH5yCHVWFoyO4Gpq7qeMkQ7x2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3rWM0Ph0zfQmhZ7eG7etECu57yteAJbYuserYQkQnM=;
 b=la1u04HBM9JABtCmSzHJDBgpND1gmbT3V6yx5eGMc31IRM+58sSHYtGGPNKkChlEWdUJdbhwmsSvxEZDH2EdbZ/97pnUS/m9UiQf0qAHO9EcFFEwAZb4e2Ees21IR/OyKBQvE1BuJ3GdglbvFSKqfmKoePLNFsJbB31azcQrCmIb9bXWCiuYdePpmec726vGACG9qxqM0t9YL8X/xNg0OXZSn0q+M+/Kx5FLTGSqdJ6ZalcOTJA8EZ9xxJm+qh4cFaOcviTzx+CWDHmAuCFRlIw2dpVAUSWrNnsJVp1c5tKn08sn93Fb2CymaXU+HJVx4vU5JfXd1JtuG3iGco50gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3rWM0Ph0zfQmhZ7eG7etECu57yteAJbYuserYQkQnM=;
 b=HMOaMG6bGzjTcLjY8k91toFuTYnJiUKTjsa68Q8+KQeYq/pHWz3zzk8JRINZ5YYekwaAV5jsSzXzzKdZT1kejrbBqxbGvxP6b18PEsjldDCEZE79cDdgRceL92dJdjKDMTfY8SqJtNcZGCLgWyutZjgRPIZIXrvsJ8lIvjlF4jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:49:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:49:21 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] Add USB2.0 support for RZ/G3E
Date: Thu, 29 Jan 2026 17:48:47 +0100
Message-ID: <cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: f21235d2-1ec5-41f5-1658-08de5f5659de
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x354Kpb8f97cHDnEAvzIpTRcjNZ2DcN+4f42eV+yD5mHuNB8/39Oq97kP13c?=
 =?us-ascii?Q?QWO5M1LCbqmRgGwh+MMySJ3sVdc/GwnapPzfA5GNKn/DfRMbFv4wNsOlyUYn?=
 =?us-ascii?Q?8BqiSXrWnxowt9769VmCYptBOQ6pgeT6dGehL/yiiZvQwnMDpCMuZzgUOQsi?=
 =?us-ascii?Q?sXeqfXwMpcsOtTiCyi8276CkqfGLbqCYUlZu5v/MdccaHXEPmwXpg8A7p/pF?=
 =?us-ascii?Q?pgOj+LzAtKhXRpTwxpqaAazoU2LBtY6zydhrXgxDb5LSbzy91ZrPvNcxJlQk?=
 =?us-ascii?Q?II2yU32FE9vezl03lxdZKbB7HB+vSA72n4y8JoSGwR0dafR4YIEJSHex++AU?=
 =?us-ascii?Q?UpYsS7oopuD2cPcBC8HE+7eh1qDPoOmjtt+CZKH4t4Ix/FmUAL+OjPNtIw7u?=
 =?us-ascii?Q?DSMWEVSuGCdnuHlmo5Abq6BTI7gTWyzqvt3z+LTsGgU755XRUvfRU4evb30C?=
 =?us-ascii?Q?+R+CSxbtMsgCqLfIMslxYfqEBvM35qeah9eUhbusZd9sNEztMcDfMNkBLgeC?=
 =?us-ascii?Q?JnYV3fso58ldyW2tbp6Af/MwI2SPp2HrXnDulo7uiIvfMm7g8Asr+pyxyr+p?=
 =?us-ascii?Q?tXzrjxIP8sWuDFj+iEl1brBBdRMXx8mq2YQ/T5h9LOds5kHlEyosYKDpsK5J?=
 =?us-ascii?Q?gUp2Ct2cBd2QCqiZYYl6c5zwWxKfw/PTG6YP4OiGBnkDb9I31EeunfsuMoho?=
 =?us-ascii?Q?RXDAeWRIX5uFT22l1Sph3a+i2j8nQzhFiLrKxbo1ZTXgERQhJ1EJ9F+QQnzN?=
 =?us-ascii?Q?L5kT+g5+kzdcRPv6kYckF5Ahd9zElCnu2oH3ft/iCZPFiQ5EYD+t7fRnjYPK?=
 =?us-ascii?Q?kINPkrZrXihgu2Pq40nap9UQMImrCIBEjmO+UJJFhpyiIHA0HqFF+OQ5jMF/?=
 =?us-ascii?Q?xDqT/058MHI2fZVJPVryP767tisakXF2VRV1I67QhOQfrzwBbjePAD+d09nb?=
 =?us-ascii?Q?4rFhf8vF6hORPirDAeb7zPm8K63iLOATHKKKQFrvlluNHoPnQWzCE3VQeYiz?=
 =?us-ascii?Q?Ib4vyLTHLzwnHzbUV1ZpVvHFvRz7JrUCcVWxfLrQsFWN2uA3GZrsgg/4RXin?=
 =?us-ascii?Q?uLjcAW09w5H2+SyL7a98je6w6DpthBEQPLGO3bNMigaoWo7X6O3MQJaswuhA?=
 =?us-ascii?Q?STLQ6DvI0QWYt7Nffq7n0uK4AZikHKPuzWn1o8RDkoZ8SSM36WfcMgfQVrBi?=
 =?us-ascii?Q?fMhswgLeB0bDHwJqIAUw3zBqT1S+zB53I2OA8aR8ImvKZzh50u6lUGUH4sNR?=
 =?us-ascii?Q?Dc7mG/cGBeHBwmFzFFCOiNqoR1f8THAZcdMDpdWdk5RewuDRCm473RkSwTmM?=
 =?us-ascii?Q?Xq2N3eJq1sy3TTPwHgiY4dZxACB++CcvSQXVJcXDrbRUTCaOdNEzVLfO14R+?=
 =?us-ascii?Q?fxfacfIOMKSLVyyf92cXelS/geyqy0Nz/R83n9GupHdEG5xTxrlJIuplqh6j?=
 =?us-ascii?Q?gDnyYzn1c/ySc03RKWtF3cKkJEuGHqw/h3yjzMXRfoFMfaaGSEA7AnypQPYf?=
 =?us-ascii?Q?iRKfmmrhffLm7fZlNHis0FFwSyvKWsCe7OnlXHbvBPIbz3YpJZlden6VJYIv?=
 =?us-ascii?Q?9zA/FnUHqZb2HFYAZ5QSbf7lr7DrU3tqJsOPmjvqxqe4FIiuHmuAKgXVxMyS?=
 =?us-ascii?Q?87C5OmVb0e1nCN4n9WZZWYc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pUqFWRlkZsX4t6k3dS9N+TU61kXEN8VSx/WAgl+rbtylwcUGmGstm1WsPcLg?=
 =?us-ascii?Q?2hWALfkCYapmvDEaiuP9QDrojBdeWB6kMtcItVUBbTeqja1dS33rqhrXFGv4?=
 =?us-ascii?Q?A7CuSImJ8rpXTLyMSuWFllCnQCDTPKJSmtvFkPa11ym/6EiWptzc81LeKrB3?=
 =?us-ascii?Q?und2IQZmnGcoP9nZJdJhOiWg05xb14k02sI2Y0X+hT3TABEpJt1IHxWqInL2?=
 =?us-ascii?Q?nnLv74vn2AD+cWcwb+HWF3DSYur+JZE/ztkPrQGYfgD8ZoJDfUMHBo9IpBA7?=
 =?us-ascii?Q?TFO324qE3wOt7TzIzD+0oAeE688xFYfd7JarffrfhtCNjNUr87AsWZ5JzcDZ?=
 =?us-ascii?Q?zNLt2PIyKnXjBBRuY1JgP0tkm3QgUqKYsUEv9wfLj9/g0vELUyUayJLCdCgs?=
 =?us-ascii?Q?F7+Cty7CpTyDvSRrJN9q4wRg4RHxqu+P8BYfPBHj4cktN4/ZWWMAI3u98h5s?=
 =?us-ascii?Q?yqezm69b/yZ0rBvhbeDDotSNd6IvFHe2fu2+tyc3PH7qwF2AhYNRxak7uIPc?=
 =?us-ascii?Q?GB/zujM1htD+Be2ra4rQ/ytWo1ijx9erDEycjoRdVvq0smt4f50I0juXCj2J?=
 =?us-ascii?Q?u+D7MxgfaMBdHUIa2YDkgFs1sSjkYuYJCDKzAuSDJdmc3liLZBreWAKlETWN?=
 =?us-ascii?Q?H/KuZsgtALeMmyH7S3/fEVNBpV3YBsTJNpKf6oVY4OBt/iNUf+1zPiWhvD+c?=
 =?us-ascii?Q?rHN0pKsBauwsreMaS0zmecGEOTk2zrRoF5puBD9gQPjBoABeG3TdbY5EpGlm?=
 =?us-ascii?Q?MUA+yhT6kRY1j7WvqMell+BldaQ5uk1sREHo4orIR+QH/pvc3sriIL90kvJD?=
 =?us-ascii?Q?HNP8P+NX0w7JtpK0x2mSjMNiMg4K3QrI5WMGxTf0uA2NrJft7aPqZl03OEPS?=
 =?us-ascii?Q?rQlMvgmJXVFUi3IT9gw+zbeRV2dm5RNug//w3dZNvc/lf2AmgCmCMHNiQaIJ?=
 =?us-ascii?Q?M7o9KEMbzvQg7c4GYtHv5M4DYQyJG7S8z4ZzjzV6JyFIqbvT0kTzFCZJvKUu?=
 =?us-ascii?Q?9FkkBaWO+80CM1oKRhdZW9pVD8DS2VKgnwrWLc54IPTqWx/+ioYyoVP7Lo/r?=
 =?us-ascii?Q?9aAsy8ALycm0ZQww8wQwZtIOqAV/GK3mLFaNaPJrwN+/3TIr9R0ePEC0kYl1?=
 =?us-ascii?Q?DifNeMSs91i6afs2GfJl/9gY7HuhXoEChwGjs+y7tSZTCrvYtgBYD54v64p/?=
 =?us-ascii?Q?nIYRH3iJrjpv6woiZRuFsBif02TkF70sOLCd/uUWyqAqbQFd2dd7kRLdebKq?=
 =?us-ascii?Q?vF/lFy0fRTaZg6kSlGWV1e+9e984JPDNIC0A6n+yivzn7RsneBDm9Rx9wDO0?=
 =?us-ascii?Q?BfcYz7xEYXkIWnO0Xbv4n6v6YZzPW7PW4IMIxxejmck7bFid37nw9uR+1kMg?=
 =?us-ascii?Q?vJcNjBsr5pTejXR3KZUXqP5UU1tk8/ZoO9mDRkJeXOhsFgqvsA7mvJVabz1E?=
 =?us-ascii?Q?9AeUrq8+L5gT/3Tqw5MjUxcU6XsH4uolyjIbsc54GCZexB9WIAdfK5Dn7dqD?=
 =?us-ascii?Q?DFOF140CoILnSYvsRgsOzpdbpXjNPAkCw5WJSaU9MaLqO1x23cyxSBSd1agg?=
 =?us-ascii?Q?1+oenqm4PmH97KJdH7F4T15PApM/RLTmIn014KQe8Dbyhgbyx6MD+uruvlXT?=
 =?us-ascii?Q?0cvMRLgFM6Cx2Gc8KHzxZlImnaQe1iNF8v9YdNaNsqB6F+Bno/2ehRRNpEYW?=
 =?us-ascii?Q?16vOJ0deIyiBpt/VuE9Vxsb/Icv0o4RC/WRj3KLTojs7ZTxiXoWktiGiRpmr?=
 =?us-ascii?Q?cmD4ShCXpBsQBw3Jwiszlc8KrCKljEwnhO36Cd2UN42BIE8Q2+NX?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21235d2-1ec5-41f5-1658-08de5f5659de
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:49:21.3709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4iXBqtJ0pAm2O06CfBIfd9aMHsCQqWlrJIAkveK1LZwQT8vtaRIn83wOjPW+WIxfmWvdb26JOP6bsQqquZHKip9ebcUeFMIe2B3kQXPPPBfrjC7EXJ7U/V9JapzDgDx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27615-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61786B26A4
X-Rspamd-Action: no action

Dear All,

This series adds support for the Renesas RZ/V2H USB VBENCTL VBUS_SEL mux,
which is required to properly manage the USB2.0 VBUS line.

Splitting the series [0] into per subsystem series for easy merging.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1035721&archive=both

Thanks & Regards,
Tommaso

v6->v7:
 - Rebased on top of next-20260128
 - Splitted series into per subsystem series, no changes.

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (2):
  dt-bindings: mux: Remove nodename pattern constraints
  mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux

 .../bindings/mux/mux-controller.yaml          |  6 --
 drivers/mux/Kconfig                           | 11 +++
 drivers/mux/Makefile                          |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c               | 97 +++++++++++++++++++
 include/linux/reset/reset_rzv2h_usb2phy.h     | 11 +++
 5 files changed, 121 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

-- 
2.43.0


