Return-Path: <linux-renesas-soc+bounces-25497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7255C9C3A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 17:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 271124E05AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 16:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16B8292B44;
	Tue,  2 Dec 2025 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nFoJFL2l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD028E571;
	Tue,  2 Dec 2025 16:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764693412; cv=fail; b=h8M8wiF64tbMDOoRfm8l1pKT9r4Sl3qm90dWZzh3ci+mBSl4Cc/lpdeOq2rGNEIUgLrlqS5oPuXv3zsqHLML8kZFnfJivWiYxswtYa/2UNv5khDeq4q4mU9p3m9T80/Ywxa0QS62VrzaF9iDhYEWFD3YEQGCGYM9zpT6F3ou1ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764693412; c=relaxed/simple;
	bh=ycyCi6cg1fazgSBo7BfVM3i0X8UQJrW+6NvqLnoy8Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eNbti6AUIxOKa0VYYmwLVzANyiRTvdtN0cldT2oHTWFkY/WQ2qGRKea0d9N7JZHG2Jzk7AVzx2zNHcsrJYBmHDIXxwHSP4Fg1GlJ3fEBjcGi2RGeK4mExJZP/zjj0CV4G4bZssnPsHHbeLiJT7rIQZMaAQfE8qxZ0Wq44VWAhpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nFoJFL2l; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGFKiO9GWo0T9BIVaV9wGvYODNzJnvMA+ga8zXpL6/rSRyoPhZbouCJv+ECj9JvCgor2+jP3VznC+y2cfkX4Siy80ApBAgvojgeLuaROeVazD4NqQWtH4SUFHEkLHr1PIaLTz7HZwf3RzrDorlGK8L+y2jmt1uvfQLO0E6fe0V7pbYBqVZIM/htHe2Ft8KgmW/pyErNOfaX3gStQ+BPWUUKG1EAofHODWXR1GQCEA4KNPW7eKCW5kLuBlv3gWKqZkIbkV1+ncHHmKYWYqNQgS7gy8DRNaKc699vmw9iCDURBl/Ne+tecKMZYgOqRzs9en5yUrT8aXzOtxTPk39XNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70k2T6mHIP3rL1FTpvweOixxD+d8C5Aw44lPH76GP1A=;
 b=bLzRpNIkbLeCFvbxLvaI3caB4is5B96NNMxkxMTlySK5VpvGelAOHVP9nko5rEuRQuEnpYuIOS0kxf3JZ4McoFGi58m/uGqHeyEXQOC5cmiKKobkSOfwRFikr3lNsxLxbnM5JCAjS32SNlvHUW2Qq1f6xgl5M6fnIRyN7tNeDd1YWFep0BZKdpZVnT4D7LRYGrMr7Zy5DBiR3UQaepsZKgwg+HB6B5+UFcCKIVvzHV0wp3yy9VMKoItyBepNpCEYtrsRI+k3o+DVd2nCnoRc1lPnbZxOrHl0hcdcWN2Mqf4MEJub1+3OOdO3psx61PZhLlV9QjWML0srao9XAQJMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70k2T6mHIP3rL1FTpvweOixxD+d8C5Aw44lPH76GP1A=;
 b=nFoJFL2lbm3zkp5I+aWTG2HH7VvMpdpLD+6XaqRQaVCt3/bmtmxsQjarqkaWJsvoss9O2npqKzCIU/VT5PBv0Irl2YgJ0XfLufHo1Hq2goolZ6TnLJjhq4jfwp6NHMoPTDNSIo9k6EJBH1y7GrJpwKZCKnShH8VHfHWv8EspU7jaaXPptmeiUNrtsqG6O3/WP2vIQDXKv4C7ifRjxCm411tFmAZR++YBHNU7iObv88wRwFhf/YbSZX6VwNUGDwgHJqBgZirkRtbqa8ixegvTjY0pk+HQHaZLeyuKKSjaObXeytrRSkKfn4RO4tN5XODh15bwMo8nslKJWSlkdix61w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by DB9PR04MB11534.eurprd04.prod.outlook.com (2603:10a6:10:5df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:36:45 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:36:45 +0000
Date: Tue, 2 Dec 2025 18:36:41 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, 
	Marc Zyngier <maz@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
X-ClientProxiedBy: AS4PR09CA0030.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::20) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|DB9PR04MB11534:EE_
X-MS-Office365-Filtering-Correlation-Id: d11a68d8-791a-447a-e147-08de31c0fb86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWJ1Qzl1STcwOUNldjdUMjQ0bzU4b0tHWGM2S3dlNUtqcGovV0Y4NzVUdE80?=
 =?utf-8?B?M01EWHh0SjZnYlNhWmZkcWs3MG5VNUZFb3ZrUDJWK3VzR3dENVcwdm1KQnRm?=
 =?utf-8?B?cEZwNVdMbDBhTk5VUDVMcUNaTVM1QmhFbTkybDZJUzVjSEw2bmpuTHpuRTVl?=
 =?utf-8?B?NEM3WEJEelF2ZUZtclZ0dmJXNkNZRnZrUVJiYUVNUS84dEIwaGxnY2ZCbW9N?=
 =?utf-8?B?eHJhUHlpeDFIVGtROVdhNFFCNDBXK0c4Y001Witqb2FEMFNkMWc4VnRhSSty?=
 =?utf-8?B?WGVCOUJZMFU0UmVUL2tZYnEvT2N5Q2ZwRVVyWld0bzcvek1lUVJreDZKcDlJ?=
 =?utf-8?B?WWZCbDVBTlBxblhaUkdEU1FFOExETXppbzBTQUU1bDhzUzhCaysyWHJVaXBC?=
 =?utf-8?B?QkppdXJVOGdxWVRjVTN2NHlZOXBGZkNQZzYzcUd5OXVpSGZ1QXpaM1J4SU9O?=
 =?utf-8?B?aWxpTTkvYzR5V1BDL01IcDdvV2xhakhjZHl5eGpsWXZJRGJDMWZiQmxXVmZG?=
 =?utf-8?B?U3RLdG9RU0JsbzdXYjVDUjlaVFdmVlRwd0hjRnlIUjE0V1dvUlo3TTZyWEZK?=
 =?utf-8?B?ME9uNzlhUmIvSElZb2lkTFVNY2g0NFNVeklRbEs4YkpVRExNMzJjU3RMK01v?=
 =?utf-8?B?cFZRa25Jd2ZNNEM0TXVGQURudS8wZENYLzhnRVpIZXZvU2piWmxlL3NQSXE0?=
 =?utf-8?B?L0g5OGJYOGhSeGVoRHR2QUpFdHlpdDF0TlVIS29ZQXJxb3dPelpaYWl3SUxi?=
 =?utf-8?B?cisySmZ1elZUc1A3WmN2UVFqdnh1Zmo3YW1STHRZY09RcnlLdWpoTk5GdHF4?=
 =?utf-8?B?Ym9hbWg5WGZiWGdpT2VCNXhnNjZlUkFIRHdXWUwvaytCWW5QRTE0bjdlNGlu?=
 =?utf-8?B?d3U1ZnVUSTN3R1NyeEFrelNuWDBPZHNRVWoxbkxZK0d5SGN0cGJWWHgyWTUv?=
 =?utf-8?B?UDhVVkFHRkNJckJ2S3ZRSTh2WVhNN3pHUDh5ZWxHMVJEeWd4WFNPaWRROXl6?=
 =?utf-8?B?R0Q5KzM0ZWQ5Rko2V09BTWJvNHBhSzkxd2k1NGhQYUVud01kSWZ4cG9JSDNr?=
 =?utf-8?B?SVZ1OGlQVmtkNkxxcnRmOHZnR1R4SExVbGlXWkRmNjFaZThuZE83aVNDYjUy?=
 =?utf-8?B?QmIvYnlBdERjbnpNQzFDaEt0bUpsU2x6bGJvbko0WHlCcFYrUy9xY0tSTlZw?=
 =?utf-8?B?RmJHcm95YlpDR2dNeHNQSkFEZjRoZlg4VUhWVFU2U2VOMmV3MmxBdExYUW1i?=
 =?utf-8?B?bWY5bDk4c04wdlJ6SG5OVnVOZUxwZ1VLMld5enJWSVVYR2pyYlc0YW8ycWYw?=
 =?utf-8?B?NlM1bUc0RURWOG5uUWRGalFqSjZlKzFQN2NPNDZJOFRPR3lMWncxY3NGVFR2?=
 =?utf-8?B?NVJWOFZtK21SaTRiOWZ0b1RWZ2gxTkFBYUdrMWFOS0tudkg0Rkk4T1lUckpu?=
 =?utf-8?B?Vk83TlpXVXBrL1AzdWtGUHBaOUEyemVZRUZwNDVSN0JMSGI1My90aEIzaEVM?=
 =?utf-8?B?VVVONmZFUHMrcTBhY09UNzR5d0RXU0ZFbW1kYzN5VkMvNU5rMDBaTCtNUGpN?=
 =?utf-8?B?c1YyS1g5bERvaVJtQ3lzZ3d3azZZRythY2UveENmRnBzVjByM2NOdWJJL0px?=
 =?utf-8?B?aVljMGR1ajExbFpDYmtJeHppWEJJRzkxQWJFNWkzcmRPWVRvYWxlSkJlRnhm?=
 =?utf-8?B?cm9pZjNlRWFaeXYyVlJLZG9mMjBBZmo3QVpjRzNXZnZzQ1NzNFNjQkpRSVpF?=
 =?utf-8?B?ZmxIMGQxTU5DUURja05UUUIwU1lnc2htZnVRbjU5NE5OSDVmeFNSakJMZ1VG?=
 =?utf-8?B?NEpDaFJZUVc1bUhra2k1U3doeHdXK2NQNDh1eUlScjV2SDRLSlI2eVN4M1JY?=
 =?utf-8?B?Q1ZPTmowZlhsVUg0MTV3YXM5RVdDM203VW9yM2pSdlkwVUFURXlaZU9ncTkr?=
 =?utf-8?B?bTFmQ3VMZGVmZlNlQW1NQnJqVTQvZFNGb09jT2NER1o5STlPSy9nNk5hSmNo?=
 =?utf-8?B?WkpYR29hSXdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXBWVC9XSU5pQ1hDSHRadHJoanJ6MmtWcGc2UnFyMkIrS01Xc2RKU28yMUNB?=
 =?utf-8?B?Z0ppQXRreDRPbC9CWkZTWkEwT01DQis5SUtZY3JOdkJvUlN4OXdMVlpWRWZq?=
 =?utf-8?B?OThMbFB0T1JEbFFndE9GekdrYXhua09pR0lZTGlBUTdudHozaU15ZFJ6cTRm?=
 =?utf-8?B?Q1FOVVdTdU1KclVkRkkvSnNHcVF2Vm9BMGpZVm1FdnRHVVVOWkw3WVhoeU53?=
 =?utf-8?B?Q2RiUzMrUkRONGxucnZBeHFDczlJYU1zYjZYK2RZNDB1RTRQbHZJa082Y0pG?=
 =?utf-8?B?bmNCSlp5UlQvYXY0SmI2M0VxZ1J6SWx0SmpQMFc5czZVWGhrTFVrWFlLcEZz?=
 =?utf-8?B?cVAzSWtFaHVVZm0vcTRLSERxbnpnendCS2RXSEZmVENMditHYzdoV2lyOFVm?=
 =?utf-8?B?ZEJ5UmZrdDFlMlRBZFNoeDBCVWFra2trT1hTUHI5MlN6TldVRERFMjNHQVRt?=
 =?utf-8?B?Y1Rlam1Kd0tnMzk1ckJDcXRXblduRnJ6aGtMa0wvVmYra2VaSThzbVRGUjJ0?=
 =?utf-8?B?dFNEK3U1Zjg2ejd3OVZIa0VmM3Rlc2tqMUNkV3RJVit6OEMxL3JLalhiMEow?=
 =?utf-8?B?emtYMlBaOS9RMFp0dnIxa3BoaFlqS2Z6SHJuNUZGYjBJemdTelJpTXNtR3Jy?=
 =?utf-8?B?K1plTlhQK1VlSDlIUXcxUkxJb3hKZlR6cHdsWnlEclhFRmkvbUtGdmFCcHpj?=
 =?utf-8?B?U1p6K0k3Z1FlMVU5ZnYzU2Y0VlFOd1VOMEZRNHp4cTVmckR6SklqR21UcVNz?=
 =?utf-8?B?QXZTMFBHQ3RFSmJsbDRnSkhzN2pRZlZFdUxVeVpzUk9ZWmgzZWExN0lNQ3Ax?=
 =?utf-8?B?M1cyanIzNGZ3UmJ6MEhZMlFsT3NDdXVCQUNyRXNTb0JtNHZMRWRKWk43eERK?=
 =?utf-8?B?VFQzSXpQdWQycysxSnQvQ3JhRGJITTZTaUNibGNpSTRaTmRIT0ttSCtGb3Ey?=
 =?utf-8?B?cWRsWEpoZGxXNTV1cmN2MUQyODM4TFU2c1o2R3UvY2g2a0NiMjRRdUE3K000?=
 =?utf-8?B?eWVTVmtwaWVYcWFsWTRaV25saWpYaGdXazJMRnBnZG9MSTJlaytXcEtvdDlY?=
 =?utf-8?B?L01iLzNYNmpXd004bnZkcll3WXlybWJVRkVkRU5qRUZsbU1OL3o0WGJMMWhX?=
 =?utf-8?B?L051eU1CV2JuM2M4aUJrNnJNUklpa0puMU42UHlBd0krQ2xXcm5rV2QwcjNu?=
 =?utf-8?B?U1V0N2xaYkpNU2lmNXJmd21Qak1ZaXQ2YXdoUkxyUjZOZDFJSlY1UjEzbWh0?=
 =?utf-8?B?V2poVUtHd3E1a3B5YmlrSVVUdUM0VGRENklIVktzRGRORzBZK3BzWnJTbmtI?=
 =?utf-8?B?QmRaUTF2WjdoSVNveThtVHhrOE5NUWFBY2ZmRFNpV3BCZzB6VzhTZE14T1cw?=
 =?utf-8?B?WE0rei9UendhOTUzQmpBeE9DRC8rTUt1SEE1N2lXamcydDFKdFI3KzVQYkNk?=
 =?utf-8?B?YWJ3N2NpVTRYclJsblVRbzFDUGJTRTNBMUQrYmxhTm1JOEFqeWFXWEtDek8z?=
 =?utf-8?B?S2g4ckdEdG0vNm1LYnNQcmxid3NHU1BjK21XOUJSeVFieUFQeGE5SEJHYW11?=
 =?utf-8?B?eFczdFJLamlKVzhFUEVvVjdEQnYxaU1xbmwzZUIrQ2V4YkRwZUlMZHdPeTFk?=
 =?utf-8?B?NzZ1dmVHNTVIYk16S2d5b2wwTmczNTdRSWhhOC9IbVp5RmFUYVFmZzViaUY1?=
 =?utf-8?B?eSs3Y2VxMm52WFhlN2tlRjNudzljQlArZ2NoL1R5eXc0TEVFV1c3Z1VsVzlF?=
 =?utf-8?B?eSttZkVlbW1wU2k0dU1KcXhmL2lNOUxrMkJTWXBzT2RvR2ZaRjdJZUVlYitz?=
 =?utf-8?B?RHExWDZrMkhxMkwvNXNhK2IzTmEvTHI4VktSekJKbU8zRXNxbXVleFlyc2Vk?=
 =?utf-8?B?ajh5QjR6SHZoVG9TcGVoeU5nVFpBV0x1M0JkNFlBQnptSSswSlBlY1NWWGNF?=
 =?utf-8?B?cGQvTWkycndUV2ErZUtvbUNOMWQvdldQdEhGaFROSmVHRjlLRWIrMUhrMkdE?=
 =?utf-8?B?SmNycWN6YlVSRENXQnRDdkcwNlJCRjVBRjRkS3ZPVk5DTjNxM3haU3Yrb1dT?=
 =?utf-8?B?YUtCOHZTTUhISis1Q3BhclNRcUphNVFhc3BLVmtlVkJ1NHZRSGlSS2VsZXVJ?=
 =?utf-8?Q?tTbZaR2xVT7gA28ukowRScjuY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11a68d8-791a-447a-e147-08de31c0fb86
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:36:45.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CnPdcagZhQt/Dq3KN1VtBnpVlRUxmm5ZQ1ZxtlJk2QsYSwNgofOGB1k3c0Ee0R47n4cypN88oky7b/NhmYlLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11534

On Mon, Dec 01, 2025 at 06:09:19AM -0600, Rob Herring wrote:
> On Fri, Nov 28, 2025 at 10:43 AM Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
> >
> > On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> > > The Devicetree Specification states:
> > >
> > >     The root of the interrupt tree is determined when traversal of the
> > >     interrupt tree reaches an interrupt controller node without an
> > >     interrupts property and thus no explicit interrupt parent.
> > >
> > > However, of_irq_init() gratuitously assumes that a node without
> > > interrupts has an actual interrupt parent if it finds an
> > > interrupt-parent property higher up in the device tree.  Hence when such
> > > a property is present (e.g. in the root node), the root interrupt
> > > controller may not be detected as such, causing a panic:
> > >
> > >     OF: of_irq_init: children remain, but no parents
> > >     Kernel panic - not syncing: No interrupt controller found.
> > >
> > > Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> > > parent") already fixed a first part, by checking for the presence of an
> > > interrupts-extended property.  Fix the second part by only calling
> > > of_irq_find_parent() when an interrupts property is present.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > v2:
> > >   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
> > >     controller handling"[1] to relax dependencies,
> > >   - Drop RFC.
> > >
> > > [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
> > > ---
> > >  drivers/of/irq.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > > index b174ec29648955c6..5cb1ca89c1d8725d 100644
> > > --- a/drivers/of/irq.c
> > > +++ b/drivers/of/irq.c
> > > @@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_id *matches)
> > >                * are the same distance away from the root irq controller.
> > >                */
> > >               desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
> > > -             if (!desc->interrupt_parent)
> > > +             if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
> > >                       desc->interrupt_parent = of_irq_find_parent(np);
> > >               if (desc->interrupt_parent == np) {
> > >                       of_node_put(desc->interrupt_parent);
> > > --
> > > 2.43.0
> > >
> > >
> >
> > This change irq-ls-extirq and commit 6ba51b7b34ca ("of/irq: Handle
> > explicit interrupt parent") does not help with the issue.
> >
> > This is how the DT node in lx2160a.dtsi looks like:
> 
> ls-extirq strikes again!
> 
> I think something like this should fix it:
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 2271110b5f7c..c06c74aef801 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -593,7 +593,8 @@ void __init of_irq_init(const struct of_device_id *matches)
>                  * are the same distance away from the root irq controller.
>                  */
>                 desc->interrupt_parent = of_parse_phandle(np,
> "interrupts-extended", 0);
> -               if (!desc->interrupt_parent && of_property_present(np,
> "interrupts"))
> +               if (!desc->interrupt_parent &&
> +                   (of_property_present(np, "interrupts") ||
> of_property_present(np, "interrupt-map"))
>                         desc->interrupt_parent = of_irq_find_parent(np);
>                 else if (!desc->interrupt_parent)
>                         desc->interrupt_parent = of_parse_phandle(np,
> "interrupt-parent", 0);
> 
> 
> But really, at some point it should be converted to a proper driver as
> there's no reason extirq needs to be initialized early.
>

I just tried converting ls-extirq to a proper platform driver and it's
pretty straightforward. The problem is getting that driver to probe on
the ls-extirq dt node since of_platform_populate() is not called on its
parent node.

I would avoid changing the DT and adding a "simple-bus" compatible to
the parent nodes. The other option is to add another simple driver which
just calls of_platform_populate() for all compatible strings defined in
fsl,layerscape-scfg.yaml.

Ioana

