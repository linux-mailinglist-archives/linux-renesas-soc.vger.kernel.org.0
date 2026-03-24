Return-Path: <linux-renesas-soc+bounces-30137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALeoE28cwmlvZgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 06:09:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D003302274
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 06:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1A8F3033BD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 05:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E4F299A8F;
	Tue, 24 Mar 2026 05:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C/WHHhOr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4961573463;
	Tue, 24 Mar 2026 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328933; cv=fail; b=nFO6LdbP6y4rcWC99uiBULA/goIDto/aJ0N0zqmCrUZ3SXazyg2T/0390nzCOri+m+Rs2uz+CgH9r0daekQkciD1mUDcAyDBwak11jvoy+KOPqreZEyeaoQ8rUOc4A1tygMiSI/qxpIIfMk4nyQhpB8ew3p+/OyW18x+vNZY+gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328933; c=relaxed/simple;
	bh=XHdAYXo6L1j2+MjKnwBTMCxq3YWbZ6+O3rHAoirBKa8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ansINac8HBzytp4qs0E/A3/gfHjVLTDxcM3yIoLg2XwRhQO6aABKkk65F6/IkrTInbk3YXsn7jp76YlqbO490+qAajN5uWap8S5yxuPLr5d7Ao8oos0dtB5zyKOKqcFzrZ714LyrQjPghEHNKICnueKsiZ39+ZvAFFpg9O1PRso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C/WHHhOr; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO/CIoV1XjSgtZBa59qw62iV0U0f4vckpHbIGgeucHFMwJ7NZ/ZHhMmXAjCFxcoj0fYnl9f9S+5TzZR9/5Zuc7rBaDk/qNihNUkZrVPXHoDSmimW9YwYBMul+J0rI1bv1AgxU4iak4LwAJ476pqh3aYF5D7gpPLscZZKifv09A2+pNc8tg3l8VWtPj9quIe2EgQ3b1Kil7FHRwAdVBudVZrRiVyIbfZTt4QB9QQOK01ZN5QUNNLxU6PqQ9JGEMorGZ4doAyp2QDqwm+abZLHtZO1fyWpAU1/JLoAB2FM1DqRwJ1QcS62N877OKSm3vXvSaJaGMa9LufS848VZmxIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUGgXLNtGc5J4kaqOFRMBSCQsNn0akVXeEyT0gxpWWw=;
 b=zSYAL1FYMVdSblQomVgP4L2j7gSa3/9loQuHmie/M52SQRhdchHOR3ChFCQKHNo/xplAbWx0RXn0J2kvMAAJ5tqSL3g0vXqaDXLHQhaN8f4Zk7wZvxt29u6H6g2eeRlAx4fLOm0r9pF4pU4QpM0PiuFOt098PdOaI57/5Hyqu5zzZyXenQURTXepMjqFdWEBkLw82FdmQhVenvywEztfiAGRjXGy1u3f5N17cYTTSFI/deo7LwRYv3068PzVjNMkkTsgHB73oCkTzLb8u3F+bQaU2DnmLP5QgTd6cujLuajzixxFbiuMKFfu83dca/a220sqWkVIb7uEUEqQqQQO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUGgXLNtGc5J4kaqOFRMBSCQsNn0akVXeEyT0gxpWWw=;
 b=C/WHHhOrvFL+h5chhstq4vX8wmf4e1QnNaT2zoo1slFsexNHpZWZKkEUJBWCUinoQxhs8lzsSmngrT7Yc9LOO94hYkvNPDYyezN9oXzj2QhlhRMhXBE/B6aOBv7K2LWt4hq6QjzzSUPC0p1i9pA3l92MdFFVUyfO1o5rgBN+du8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYCPR01MB6817.jpnprd01.prod.outlook.com (2603:1096:400:b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 05:08:23 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:08:38 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: krzk@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com,
	linda.xin.jg@renesas.com,
	tabreztalks@gmail.com,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and RAA228943
Date: Tue, 24 Mar 2026 13:08:22 +0800
Message-Id: <20260324050822.3015-1-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0354.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::17) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|TYCPR01MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: ec5a6998-4830-47f8-fa8c-08de89636871
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dcnBTOgIUk7QF+nMJJQs7lHrwATM3at2y52w8P66OF1YXc8lxkVmq5Dh8wKI4UFLQJ+931Kf+Pc91X/2ptVOUr1MeLWVEQZRjShxZb//OD9SVcLc2JsuUFnqHLrw8FtTOkng8o7t23MoqxN8lVzBpSqNp2lnSjwYWDmUOkNEQHnqV9i8VYB2ZiNIkfWdc46YXbrNNXOM0pTg572QEcvBSMuetBs98e3KjPEhbppKckYnMq+KJIbBkVEg48kgytA3xW44xRJCluoD9AcCaJQLO09n3mZL6sUhkrBqJTfecS825Y2e2Tg4nxHOuZKp95deTJ+88G2QnJlGuPdMNVVXp095KD0V9UY2Vb0qqAG9tJ7bOUkiaiuPQ/poR63tg/nBkqq5x1p12xVgHtS/69u1sGurAECHXxjXKn0+akZ2uBaCJkGKlKNh41E4IAWKbwbcyvNSk4vB0Gt4mSorCrirnJLL/6cXvX+jYv1vY+fzZurWQaOFm78IEunbjR2txbCF79X/+ibcCrlA+shDZQcwMrugzhMFKZePA6fkA4x4P832FrrIaVFtfv0mMi93k1YpFe2ce1L8e/i2qdSkbwGaxmtuerDaXLXuHfO/dx2DbCApTBYFi6nhGNmq3rdwqtXzUp2LQ4o70Foheo+AdXtzzihuyhXLNGp6lCcANfTkylg+7Um8HN07741IQI+oH+ltLlWqKReQnZJ9R06RbBI/QYgj5yIBxShWcrzwdvKTFVYjC/4V7wNGTeDlmEm8ZnkNSwPD90wn5WJtXj7T8fNSZwv3+Zfmw0ZUp4wLZKm0lqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TFh07YMShN8xzEetbsH3AaOfcxq/DeoavGUJbMydoW0vrhKKgQ0Vby6FhJdq?=
 =?us-ascii?Q?DDKXsK+qu5btTDyHjqASbtGP9FpvbaJ1ChFWBwQePUWvvSEBMcuHbRCbjugA?=
 =?us-ascii?Q?GuG0WRKUBYtX1wkLFzgmj3ZVas6t7kXVgZchMQC8HtpbKJJIJXDpDgHUVeAE?=
 =?us-ascii?Q?YdRbloUuvYkG1s/N5UtTzXSonVFkvQxiz3Une347Atp0hNtStnuxM+N9/I1l?=
 =?us-ascii?Q?cf3w8HY9gl3svPghTwRe/NPs1QqBBEU8wlB1R+Zya9EVz/8OhLjoQi6JRofK?=
 =?us-ascii?Q?LvRQie+8JKIujW9Z7CjoHkMQVWryAaWJOaJ0bfOyH95+qm71HQE9VeC1dYbL?=
 =?us-ascii?Q?pyL2CfK0yaMOLcao8WQr2Nb+iOWWPtXpKJqoZmAG+yHnKBsi8ewdh0Cc/cK6?=
 =?us-ascii?Q?b5NDqsycCwL35HAgMCOd5oDqVOyBdONvEIJkLqnEI40MHkH/gJk3mQg8AbYB?=
 =?us-ascii?Q?BGxQoEJXhpgDYr8U7NiXxofkcnUQCJaapqpJbBaAstYR45aCiG6UlqQMezPZ?=
 =?us-ascii?Q?27/LgO0wfyDf4g78GNCvxmEnSPA2ejSJZm7JODSF90XlN9cYzDZL1UG2yB+W?=
 =?us-ascii?Q?lgz68rvN7VZYSjvKmaLqm7Dy24iVEgjUi8BAx0MKU5FHdU/Eby4ASDXF9kMA?=
 =?us-ascii?Q?5KzYnOz23efbk9n0EB7JADa23y/rKljx4GGib403zIYx7iai0Zy+2Y62durO?=
 =?us-ascii?Q?mpuJFAqalKJ7vAOpz+CNjI8mLGL7PLHW6jdhkxiH/eNxWiI6gXa8DgOY9X5O?=
 =?us-ascii?Q?XLgGLySuv8kg46yV2gyXt/8WJXStnfC9TXBVkLUSEk7K1qdt+zIowNnKEmjE?=
 =?us-ascii?Q?LhXG90KWJPaEK7xBUODQ8R8h5xCQRSXmFwyN6zK9lhWTVh9oHip0hXkqENql?=
 =?us-ascii?Q?v0H5rBPdMix6pmgp0X+p8BlQonUYhDIGk6GKsXeWJOy9qCLz8RCKRVzf0ZAJ?=
 =?us-ascii?Q?LcfWOX3txtQnr2gW0N5ud0W+8ZBHTd4MkSQTTxiNDCyQh0QlFu8LCXVoP+XC?=
 =?us-ascii?Q?kjVvnYPzh7RisSTCOKL9c9VtX1jzkE7GU+1cQqX/5RI6IGUJDE43GPm7Rz5i?=
 =?us-ascii?Q?1UdrxTneqx4Vy4BVvKh07kzW/3Ua8dcahrtyP7Mo7w6QeefmWjR8DG9ahUJ0?=
 =?us-ascii?Q?LSHbFyJ109460kiShL6YkkwNrj8jRKzCfOOs0YOm46MCfF9FTOZ87V/ZhSWX?=
 =?us-ascii?Q?gZq3fcWGE0yvtYlictE656qn3FmBPBgkC/OR5A//Ew7iSmpLGVZ3HLXnRC1K?=
 =?us-ascii?Q?Ra9ps9v6TFjCz/B70DG1403KSTW3uXfybYnQv29Uz4BtRJaQohCpFvFBGzNd?=
 =?us-ascii?Q?BhUTLQEy3eVHW6ksdmMdwTKN6TuocFuKoWRTXcIuB7FgCzvd7K4UBfxFZbgv?=
 =?us-ascii?Q?uYzdDmJ3hISylXo7byuOBrxHVAX7IAKfTjkVJB7eD85y3IofQfxAyr0Cf/c6?=
 =?us-ascii?Q?sglXgODU4qkqGTlCqkZdKzD2W/egSeMLHcYxxob2394Srf8/EU36V8K+hnsZ?=
 =?us-ascii?Q?EEnfRo8ykC/nYkOW+BTrszYcVmxZyKgCGA4qZ+PNBHUqhLd2SjkZBKoB8M70?=
 =?us-ascii?Q?s10d8TGi0vzXKj2bwmacuDbPEh6/aTMzLI84fFXS4NsouQGmLUZRlMo00mbb?=
 =?us-ascii?Q?H5jU5w41B86/JKZ8cAmEukC3Xz4dntABLPPxkHv/xu107xC1jehR7SKOFewG?=
 =?us-ascii?Q?EyMfqAc9UHUCcchFsfySfSHBsPLjG+qIHlUciLRNuBzaqfwekRKYkNSAq+9I?=
 =?us-ascii?Q?L1mQFuxYgQ=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5a6998-4830-47f8-fa8c-08de89636871
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:08:38.3213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oR/E4wuomJXmDg/8buzroPQRs0FB5fWhpDaPfJc63MvURxuRNCwzy1EhHWFbvcWECZw7EDsm9BJSuaTM/AWv9mbDo15Q49ECXOuWKrypEK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6817
X-Spamd-Result: default: False [3.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30137-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:mid]
X-Rspamd-Queue-Id: 2D003302274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Please wrap commit message according to Linux coding style / submission process (neither too early nor over the limit):

I will fix the commit message wrapping in v4 to comply with the Linux
coding style guidelines (max 75 characters per line for commit message
body).

> Anyway, same feedback as last time. I responded to your answer but you
> did not give me chance anymore and sent v3.

I apologize for that. I should have waited for your feedback before
sending v3.

You are right about the fallback compatible approach. While the hardware
differs in some aspects, at the hwmon PMBus interface level currently
supported by this driver they are indeed compatible with RAA228244.

The binding change would be:
      - items:
          - enum:
              - renesas,raa228942
              - renesas,raa228943
          - const: renesas,raa228244

And the driver only adds I2C device IDs without dedicated OF match
entries, relying on the fallback compatible for devicetree matching.

I will send v4 updated patch series shortly.

Thank you for your patience and detailed feedback.

Best regards,
Dawei

