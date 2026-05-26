Return-Path: <linux-renesas-soc+bounces-33132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDDaMr1GFWqLUAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:07:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5945D17CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1D2D3028C7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 07:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069BD3B3C0E;
	Tue, 26 May 2026 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kpsMtd1z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C737E2F4;
	Tue, 26 May 2026 07:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779242; cv=fail; b=uELpv5/4TWE4td5A3mhRNdny3eTipMVqznKElnmsmI71JOLLFmvD7HzZNg68YWecgVdP7SdQ8HLgYxVm5RNnUBObWFjZ/QLTydEXQbN+nD92dBaQktUIId9Rq0BYXzCkpVNmpqeET1LCdWk54WSD9XKsxP7K3vWWDYeZwG4V6GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779242; c=relaxed/simple;
	bh=D6R5urU5ZpHikOYnC5TqfEypJBUGrlEDuMl9Tc3vSio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R2z7RBfTqqd72CsAYUjglnfzVtChRtmn2gKlr2DrjIMdF7i3gKM8FEf9A+5IB5FZgMU1AAwHSzjz0icP5XOZo0k5jI71B9LwiHgqVVH9+u+oZ6xMRgt34xVAZ2yia62g4oCmrmGaN4VN1GmyPq4nprY3BPbx5OpXeRC+JXIfNpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kpsMtd1z; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdhS2kx6nj+6NvnXSNjo8AIDuR7D1pZW8ZEH78as9yfbE4TQUjRyZHZPODjDl+xBn+DKD/TBetaAvOyR+5fBulu/Mx5k9CcB/aLE2KO+6Sc2CPNSlQE6ZMv8SExH5O4IhXmN472lLxzG/bqghtHrkFtCg9H6ulgrXznIqg5Dr/U6LGzXJSwee3QoNGYoO56WxNQf9oZDDcK2IOj++XZbt+pN/A1WjvwtP+/Vc/IyxucAlRXc7J0io1b1hL4qfNgvVr3aFluOUNQfbD3/naAldSdDXbIcKt6MjdcpvvkH9zNaSF6R+5bX0nO+h43DApJNdIeyIGrGTT2DIz3JT+2mKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhF/GLcNGXgLm9UqRnNKlXorhFopADTB6K7I3SmE6fg=;
 b=anQT5YDrSh2CND4dM01fumbz2cg9PyCivtGXcrN9VfeS2CLgtN0dle45cX76mhJTbo1tDtwVKrHzQ50iMysbY7BGo89fdpfK942dkXTuY0aDKcxmhSsEdK/uvEUVdh4qjdz2we3tcV8C/DEpIQLs3QanhLiotRaB/gnFwC8zskDo8xhdYBOEyoidK1rqOfEBhEd9i6+uIQ5zA/JUhfWXzLS8RSmQYUdBNJKVfzbrJtPJt+3vErh4sV9csIjRNE1qH5aCShTQYDHx9hQau6bctyJ1SgMh51/IA9j4V/J55Uj/+NSP2xTG/jSCOcigEa+uYh8bbJWgz7zxpJ8j2g0T+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhF/GLcNGXgLm9UqRnNKlXorhFopADTB6K7I3SmE6fg=;
 b=kpsMtd1znBHmWjN7+B/cZ5nk1yyBrfBTavFccMeg+dkiz5/x56NgkNN7e82YYar5P23dxEHK/LTpxkD2s6b3VaJbIUoBOjJVO2Er8CYcGNq0x0C/WG0Uz/ZDyKXymZeGtB7bFr79EphjzoQzuw+IqIxmXYiVrT7NYbGXyvu23L0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8637.jpnprd01.prod.outlook.com (2603:1096:400:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 07:07:12 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 07:07:12 +0000
Date: Tue, 26 May 2026 09:06:58 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Message-ID: <ahVGkvLudN2c7VM7@tom-desktop>
References: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
 <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR5P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d0ef8c-763c-4509-d38a-08debaf56916
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|3023799007|22082099003|56012099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
 DEzjRU1/MjaKWNMpPeb+ffzmKpsGkTb6+4/kwB1Grvjgdv9wjvDdJulkCJp8mEBJ2ve7OcZ37bD+TGtWodIYF8Hbz7JjEuBNs3J+DW1a5SDWV91rVtAXe5NBTdoC88tZZzVdkpZhiPaCtLkD/qpndGhCVnCxP5SEvu/Kz+fmkYvZ2FjJ0vytN4dXY2wDos/JDONvDSK0LFr+ATxxhgVL1tCPS42NL1Z+lcOSRBJ4bNko9BNVhaVlBuTu2TgsvCc2ujkFfuCLjrBYo4npValZ9dlQtumzGTWwSBYB/tWuf3dFRdB7Snmyr8hf4djiMrVrIKiPzRkWcB8J6mr/4AHKkb5d+wf9rVtOCjR37/Ley5kBWluq+QzLBIzFFq0peZOLdXcHriKBDbquH2iWMq9CjXGOzEAQ5EHBnnc+O7RihtktnBHHSKMswfoaLE+aoCrWnTcsbq4rTxChMhfCa0TQV0YbJET80MLph8sks37pB5SoSbslbInNTd2yPcZCDogVEIN6uvN+Y1DbW+9qGvs+hY8tQaqTCc6GFM0mqKwW8xrl5Le4qhmZe2TFdvQucQW2kTC/4KSh0g25ScPQODwwFHBPHgFM77oqff2GuDRqoaflX0CVpjK2BduHBrBclIqi4PaMDYij7mnKg/FyMBpmgSgQd5U5F44FUX5vGYBU8zzuLkr/sbJ5t4ql6DDwrf16YJmVHSx8LNBrMbeMJ6w8kA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(3023799007)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Zuoiq7Z31wlzaZca2H27wb5799u8cMBrelGwhsoP7zsGKNFn+pKTzVhBYVYm?=
 =?us-ascii?Q?LuymkoX5fA5rDM7xrk4L1qQ05QWEUJclOT1soiNA81kDEURNj5jhgmTgB09f?=
 =?us-ascii?Q?0d5EuJrdwj1IRIUCFSW+F9CXN3wt5MN5z1LlKbHoJNVwcmY3NlIp4yVzQxyp?=
 =?us-ascii?Q?UGn2rKzywlJwrV3LNTHx3CEW1TEcaOc9lFo6iClEfUiNayD97I8LEyx8c7Oc?=
 =?us-ascii?Q?NGG7dOJ/GyhwRNCP0EwcWJahg+8V/OSwFFpPvs40DU8Y7CabyQ2D8zvFUM3z?=
 =?us-ascii?Q?l1lKNVU75CYfVbo7Sn96OYl1lh2/307DgQ3w0o+eE92RG+vTUY+P+oaNdqyL?=
 =?us-ascii?Q?X6VL79rePUXlzxYECwkAe7PsCG4YV8sJB3d9nRHWVAK5GKPHeXI1qrCxV8D1?=
 =?us-ascii?Q?KFYaIq2gGf5VXOXft0UCjPmh88qMwpSPaqS0hL0jB5cV5SmYur0k7yEb9a0n?=
 =?us-ascii?Q?bscpQqyLVeV6BHqATfjfa+7NGamtnKEGXjVVTcc6qekV6v2OLxankYQFAo+l?=
 =?us-ascii?Q?Bb0aA5Uifn63MJBk8c2LAaJRVgjbzVUet+KD0iUuTLzCS9TzInXagvbJSrr0?=
 =?us-ascii?Q?28gJnlsGWCqUnOng39Rs8sxUdPTGSHo/iT6gxXyM3ONlEDrSb8Vn3vtDK5w5?=
 =?us-ascii?Q?Cnls0zayhNw+4cEk1BQLOdBVlXoGljGBYT1EwMnxckUTSajpqOKBjV8NvIWI?=
 =?us-ascii?Q?Xf1pK4PmQisE7J7xLXBat4Q9UuBvnI0v4FAf370cdbr8kQ0A3/W7Vrsqf7Sf?=
 =?us-ascii?Q?q82dDNX5hB5siLk3SQqTiMCi0Fs8KyCLeL5khfwYlf0ZOBfUZVADdRLbsXQe?=
 =?us-ascii?Q?apbb9TBcl70NeFw03fk7mLCWzvsmyCtdx5bskrYu3SMf3vDRMU7yEg+4smYl?=
 =?us-ascii?Q?93iSH5GsUChv4Ef3fpHE66HB2nMWf6fVuE8rJ1Yi8wRxM/28eYapxsHNp5TZ?=
 =?us-ascii?Q?5XhCWkuyaDRPxb+dyf3I30+31WAKFWQFqh2bvPBHGXttfrq0VubJ+IqFdLOD?=
 =?us-ascii?Q?mL61OshTKwPSM/ld9hOYxYM9MQ6QdYxa+2mcQPVVa5YxKacBVWySiIAHLEn2?=
 =?us-ascii?Q?CfK8kW5CrqkD1tBhu1MiAmCREksSEIgRJX60sAlSMpf2ld2dJ/V0av2qLtiN?=
 =?us-ascii?Q?FpYcrAYEfWmfo/miQjCRVRVTgFgHMxJtMiE8CfgJGfNcGx84aFCQfCiM4vi3?=
 =?us-ascii?Q?v0OmZCpkU3zqH7l6z++E5ZyUGEBRhzLu6uPFPzksGbzeCVIjlHezsUvE+eCy?=
 =?us-ascii?Q?LZ0dYU4QrUXulSd0aGlGC3jZAvW7cGYKRrlk68P1VIuqnm5OFzxlFtD6GynG?=
 =?us-ascii?Q?OSLwbNaaVii42ckqsQoTb0AGTqnmoLuOzi6Cv9kbSntbFjrpZ+xZgaOOYF6M?=
 =?us-ascii?Q?FzowXYgpP2qmH0bwMTKRZpIulI6/RXwxm3sXrsRnbwK7LP0NQzNxwboEwXnL?=
 =?us-ascii?Q?HGGCjUrs+oM2X/0uxBDbDHFBKab0ttcfGiHU/uEJ4aK6fXixjq+ouG6LWFNq?=
 =?us-ascii?Q?NNpG0xya2r3E4Th/hCo/fqcMaacD553UIzr5Lcg/84OGaF6T/FkV2hGoWWYt?=
 =?us-ascii?Q?YvfidN5gWoNcijVLKbTxwy4w67q7BSchyuLJgZu38g56/RnRJVMWmPUAqZlP?=
 =?us-ascii?Q?9zOihb+sTStN3FpcoWPnda0g5TcvCmWDtYThApFmReOE9R6+o87yI0BQWD1B?=
 =?us-ascii?Q?VgLM5SakDfRvt/ORNTx/5mJ+n1Tb5pPQ+dZMIOJj4NI6DDVuK63sAntKCchm?=
 =?us-ascii?Q?/ifL5c0KD5Wx24DleeYkF5lG+/8ELEB5AjZZA02UzVGrdWsWbYTS?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d0ef8c-763c-4509-d38a-08debaf56916
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 07:07:12.7236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXlQCiM8Q46dNgrlS9QrxVCI/e0KrcTzJpIVwomTRZd6hUhvrJ9iBou51t7R6D9HrrkClhGsOKjOYBdxLOl/SRVnKIDSjqtShzw2e0U2UEd2/9gyTI7OUde/HBS0HvPM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33132-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,glider.be,bp.renesas.com,ideasonboard.com,kwiboo.se,bootlin.com,lists.freedesktop.org,vger.kernel.org,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.10:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,108a0000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,0.0.0.0:email,microchip.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 7E5945D17CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,
Thanks for your patch.

On Sun, May 24, 2026 at 08:44:50PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
> single-link mode. LVDS and the DSI interface share a peripheral clock and
> the MIPI_DSI_PRESET_N reset signal. However, the LVDS module cannot be
> used at the same time as MIPI-DSI.
> 

Same here, this should be v3 instead of v2.
Apart from that patch LGTM.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * Collected tag.
> ---
>  .../bridge/renesas,r9a08g046-lvds.yaml        | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
> new file mode 100644
> index 000000000000..b1f6d020ae7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,r9a08g046-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3L LVDS Encoder
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +
> +description: |
> +  This binding describe the LVDS encoder embedded in the Renesas RZ/G3L
> +  SoC. The encoder can operate in LVDS Single-link mode with 4 lanes
> +  (Data) + 1 lane (Clock).
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a08g046-lvds
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: PHY clock
> +      - description: Dot clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: phyclk
> +      - const: dotclk
> +
> +  resets:
> +    items:
> +      - description: LVDS_RESET_N
> +      - description: MIPI_DSI_PRESET_N
> +      - description: MIPI_DSI_CMN_RSTB
> +      - description: MIPI_DSI_ARESET_N
> +
> +  reset-names:
> +    items:
> +      - const: lvdrst
> +      - const: prst
> +      - const: rst
> +      - const: arst
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input channel, directly connected to the Display Unit.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: |
> +          Output channel, directly connected to the LVDS panel or bridge.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
> +
> +    lvds-cmn@108a0000 {
> +        compatible = "renesas,r9a08g046-lvds-cmn",
> +                     "simple-mfd", "syscon";
> +        reg = <0x108a0000 0x10000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        lvds0: lvds@10 {
> +            compatible = "renesas,r9a08g046-lvds";
> +            reg = <0x10 0x8>;
> +            clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
> +                     <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
> +                     <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
> +            clock-names = "pclk", "phyclk", "dotclk";
> +            resets = <&cpg R9A08G046_LVDS_RESET_N>,
> +                     <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
> +                     <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
> +                     <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
> +            reset-names = "lvdrst", "prst", "rst", "arst";
> +            power-domains = <&cpg>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    lvds0_in: endpoint {
> +                        remote-endpoint = <&du_out_lvds0>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    lvds0_out: endpoint {
> +                        remote-endpoint = <&panel_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.43.0
> 

