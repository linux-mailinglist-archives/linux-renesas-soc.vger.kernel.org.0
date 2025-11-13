Return-Path: <linux-renesas-soc+bounces-24598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F011EC59C56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 20:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD6E3A4B14
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3507331B13C;
	Thu, 13 Nov 2025 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Reu1NR7L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428CD316188;
	Thu, 13 Nov 2025 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062497; cv=fail; b=pBWVQ8TapZLhuh2YJhVLJFTvxkKYVNOe9iPZusOUOTaMJNfcdxSubnv9YrZ1qX4sxQ2AFXIp0vWTaiQ0BIFxpDbbb/mrgy90TagpusEZ8R+Qpr6VBN9gMpCeY2hrEbgXQn/4EURJY4/+jV84cSvJ4BXgmw2GlF2jw6laFR/jMMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062497; c=relaxed/simple;
	bh=+Q7Et5cxflmC6KzNw/sDe39UoKK4SedGIU7kkEwmCOM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RmKjp87/YzWIcwfkjg9cSh6ywgnWtdJcGEf0TtVe6W+HWTsmYZzzIz3PsIvTvodYWxKY85MduenPLv5XfLFPXZ1SABZaahYjjfctxMmvhjaNiYE9nIBDEZAczIGFPShjBEsQagjVL3ILJj2EDJRWH11JK5F+mFS2l7m8xXkYhL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Reu1NR7L; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7meOxFqTfWN5lPvbasm2Dfdcetun+tYkGEhbZwm1masBZpQLs04w0DcLuBSy7EK/1GoP2UKqOEasDpM3kIaDWTcS4YprLR5HHZEHNBXtTjyL4PlThZEHVIgNjPHDsINV0uQg0YKDTg/CyWlNX9HDJu4sXccNPKMgomuN6+Hwllgw3QjQtygmz3rJVi7LlfmXAnO3yy9tZMzh2vFukC6nT8sc7INlB2DaZNfFRMWuFjzrUO9zas/spmfgx7nCKT1LWfsQnANZZKiZgnu8SxM3kw0UHCLAjFqkP9h5BAQlNw4xH8gVXHJ4GkNJ7N5zsyDLMagqcwn8aFFv6BDfYd61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q7Et5cxflmC6KzNw/sDe39UoKK4SedGIU7kkEwmCOM=;
 b=Gh+wxMeeWiNkUQ42rwurf8hkMjm0G8lOFHnJd7Soorcmv1Sa/kjzXSkYB5zAUkMTkPOUVKrUQ64PpFbl+t2WdJH9El48Ff4NQxIuX4L9tVepAdZOk4d8oKh0vDijw7ofQx5ufZ7Qj3+NCK8UvERMoxJVONyIpwqL/S2i6l8MfCYLJzsiI1X2rA4a7BwQeGERE5gbaRjUiqQsfaAmj6ZZRZoS93PCtAvggesQhjPRfR8bIDMAwcMaH5Zju5+vhhPm1OQIkXnvV7lC4stoj24i9HSQmrNcw7fYlWgrzgyfg7dwi68ju82hhrkdlScZidAN71aWppycpMaeDLSnaSHMJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q7Et5cxflmC6KzNw/sDe39UoKK4SedGIU7kkEwmCOM=;
 b=Reu1NR7LEZhR2Pk6V4dVZoA1N58aOZOgbEL87k/GkF7Ny/mP4wc8nbuDI/ON3PTJaB7MLCCGVakukCALgbLSGXYkc96zERD+kTpDmhsa36sM+KOKKFLnsWxXP+cqcXwgoFvm3XLglSf+rrvx9RqzFTGxIMVHb7lic4FUPWMK0XI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15762.jpnprd01.prod.outlook.com (2603:1096:405:288::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:34:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 19:34:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 01/19] clk: renesas: r9a09g047: Add RSCI clocks/resets
Thread-Topic: [PATCH 01/19] clk: renesas: r9a09g047: Add RSCI clocks/resets
Thread-Index: AQHcR1jc0b4dsXLFYkmOqi7OqVOp9rTxBZKAgAAUnUA=
Date: Thu, 13 Nov 2025 19:34:49 +0000
Message-ID:
 <TY3PR01MB11346CB74E94956AC93A9471C86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15762:EE_
x-ms-office365-filtering-correlation-id: 3e1bb234-4963-47ad-07d3-08de22ebb60c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y29Eb0FXdk9EZU9xSnJCcllWUm5lQkdrbldpODBsbTUzSEZHYURleUorS1By?=
 =?utf-8?B?WFJWSG1LS2ZKeXVZSk94L25sZFR1TzN5RnFnVGQ4ZTRSL2p3eUV1NHdaRUIr?=
 =?utf-8?B?TDhCRHJuQzdNYTlWR0g4bHJHVHhjZjVraUxuR1lhRU1pMW9ZRFFSaEpaekIw?=
 =?utf-8?B?K2dFR1lNNGNwMWI0Q2NYY0UyOXBEVktMMjNSVnkrOVkyUDdGZ3pYRWFSSVZX?=
 =?utf-8?B?VW1RNDZKNUFTd2pubDRsVGpEd1B0cVpRL3VQeWs3TURVc0swd21VUlkyendR?=
 =?utf-8?B?VjdSM0UwNVF1dnE1NGJNZjNpQW56eUZGT1VFY0w1K1NtVklWY0xYYjN2ZTBt?=
 =?utf-8?B?aStSUlB6VEFkUC83K2hQRnJFVmZISFh1VHhlbFBCV24xYzBYUC9OQWVpYW5G?=
 =?utf-8?B?RDZpTm02MStycjNBeFJFWFF2ZThpMlVJK3RESmdJQTNHTVkybHV3cTFUSXJ1?=
 =?utf-8?B?YkRNM1BOWkp3RWhLeWxqTVhNeFFKWnNSbUpFOHdjRWRlTG10VC80anhXb0t3?=
 =?utf-8?B?TE5sSEd1MHY3RlFNZFJ2dTBYU0FZSkVJM1V4S0NnUlhTK29YVjN1bk56bEFP?=
 =?utf-8?B?eitLWnkva1VSNERpTEZRczRGdHd3SmtMZ0tUYU5vUU9vVnk1OWlydDc2ZW5n?=
 =?utf-8?B?N3NSdmZXcGlxN1Zza1JkMXhNMnpSQ0hHSGJFTmVVVDhJUjcwWVk1UUdaYnhT?=
 =?utf-8?B?Yk1XVVpScWZxcVJQTDZsTHV0S1V6RWdoVTBLOFdVd3BWc0UwWi9NdlN5U0dK?=
 =?utf-8?B?TVZTOWpUL0VTWmFFdlM4NGJXU0pUYkhjSkg0RE9yeGZ0RHY3Ri9MOUI1YVlT?=
 =?utf-8?B?VmcvUWtjWkM0blhvaHg5SmhFbVlDKzh0MW51azFKRjB6ZDJHWWJEanhJd2F2?=
 =?utf-8?B?MUs5a1JRZTFmcEQyQ3NCRDh1eWdwQ00wY2VidHJlZ0VIYTF1TlJyeDFVSFhM?=
 =?utf-8?B?dG5rUDc2S1U4Q2V0T2RPK0drL0tNZXpWSkdva1l2bjRSajBhN2toQjUrVWNE?=
 =?utf-8?B?NThRWUYyMElLaS9VdGtzd2pHTjhRUDRsQ2lxUUtyTUdzL2tnaUh2WC9JTXJD?=
 =?utf-8?B?N2ZVRUdPWFNZZ2ZsM29VT0V2Sk1SUXBxWXJ2S1ZmSDBMa1NINWF5UFJJTXhJ?=
 =?utf-8?B?UGRxN05GOW9EQXVUT1JLK0cvRnlDNWJLeDQ1QWFnaHRrMTlKZlFSdk9OSmNW?=
 =?utf-8?B?TnAxOER0MFlLMDFyMVBQQnNDbG1TU0JtcFlsSjh3Z0U5WGhGZEo0RFlDMkRH?=
 =?utf-8?B?c0tJQzlVUkhHMVBRZE9DdlFITzZjaTJsdVlCWCszZlA0QlpmeWJ3RXBnZTNQ?=
 =?utf-8?B?WHg3b3FOL0pNK01TS3dhcVdWUFB6Qmw3TGoySUVDME55YUZETlEzQi8rMEhp?=
 =?utf-8?B?UUlxaEQ0eitYQjMxci9VVHRHU3dHSnlQMmVwam1YeGxyZStzOVVIcjBmdmJX?=
 =?utf-8?B?R2tkTitKWmpNT3RUZ2VDVDRueTFCMjhHYy8vd0pab0FFSWZjL3VHMzlmeWJu?=
 =?utf-8?B?YUIwM1B0UThyWGRMc1IyQTYzcFNpNUMrVmh3TG5YcU9lSDExWm1Jb0dwZGls?=
 =?utf-8?B?blNZQkFjMDVmR1M0THg2QzEzUDZMTDg1T041T0JoNWlFK2FLd0JITlVSQndD?=
 =?utf-8?B?UTZWUFB3bjVQbDUyZ0F2VUxGN1d5MW5uN1h6bHVyTmhlL092U1lBWUt5b2x1?=
 =?utf-8?B?Q1ROYVg5c2NweFNWZnA4MnFMd1d4RUJEa3pXMXk4RlYvYmwyOWhEMVBBdlZX?=
 =?utf-8?B?S0krL1pNSUJSZXQrSFBTMkZNVWZHbTdSMElyc1RsNlhJbHVBZTRobVpuQUEv?=
 =?utf-8?B?SHRvb2Z0b3VVR2c3cUVIUnRodit4NkFKVGJpbGh5alIvWEFXN1d6THg4Wmpw?=
 =?utf-8?B?UjBFVkFjZk1XZjN0V0NWTnArUFlET0ZudEhEaXgvbFFGaGY0aEQ2U1dNL3NP?=
 =?utf-8?B?TE5GT0E2am5MM0J3SlJQTFNNcWRzNjhoUkZqY3N6SDRXcjdSSUJuanFTNkdP?=
 =?utf-8?B?c2xUMGRULzBhUUJJZzZscW4xN0dlVVFIeFJGSlNJd3Y1UWg0dUllQ1RMNUVl?=
 =?utf-8?Q?BKWQT3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWR6MzFGMk5NSWwvWTBTbkhzaFIwWDlFREdDS1FnT3RaZFZoeXFMR1hPZUtm?=
 =?utf-8?B?WmVKQlFRUEhDdUJQa0FKSnZrd2k4blRHSlBpQ05yMC84OFpDL20vcThITVV6?=
 =?utf-8?B?T1lFTEdTWHc5TXlUbTluZllMNERyNzREdmVpMmhnV0F6bUI1cmpoREdXR0lS?=
 =?utf-8?B?TmV4RmxjWEdObDhaSXg5bVpxb0pMYzEwaGQxQUo1R3gwcE9GVmJRQ1V0VnlM?=
 =?utf-8?B?eElkRWpjYjRGQlhwR0U4TTcxL2doM1YyWmRiWlYrc1VhcW82WHJrUzhHUUQx?=
 =?utf-8?B?ODNRbUFkLzJmajNNRkFRYjc3VUxCdSt5aTVsNUw0elBzbDZ2Yis3NTI0azhs?=
 =?utf-8?B?UEVWN2FTUFZkSlVBcWY5Qi92UmZ4SVQ4RDlqNWcvNlFXenpMbUQ3WnVwUEdO?=
 =?utf-8?B?SkpkRkxvQzBxaG5wRitCS0E3WkRHZmdpSDRxU0RaVUlTT0UrMHJydXdpSmoz?=
 =?utf-8?B?dGorSFMvS2tOanp0LzFSUWZuTWtSSTFqV0FiSFc0bklVbUpDdzhpcEVwVXky?=
 =?utf-8?B?MkYwM3RxWC9KbVRBNk9tMjdGNUxwUUxOcnNNalM4ZThCbUZYd1gwdmJudk1R?=
 =?utf-8?B?b2hlVXNUV1pSVy9uaDdYblFMRTRVOVcreHdTa3d6cjJTSlBXM3o0K2MrSnZ0?=
 =?utf-8?B?SHJHelhJQ0xLSzJ4Nm84b2RNbHFsM3RVdGd4MnkvK2k3eE5NUGp4aXh4eUFn?=
 =?utf-8?B?LzUzeUxGL1dCUmUvbjF0eGV5UU4wY3R3NGg3ZXBLRnd5UDNYMWVsT0h0cUlz?=
 =?utf-8?B?NjFHN3ZSWEdGWVQ1RDlJMndhYW0xcS9RRG4xYjQ0VFBxd0N3dnlKWUdtNk5Y?=
 =?utf-8?B?ZkVFWXBkMVJJWjlzanpCWjVhWVU0N0xIejBjU1RYQzM5R3RBYnJ6aEthU01w?=
 =?utf-8?B?d3hRRG0vM2tlU0kxT2o2bWZaWWY5ajZsVmV5NHB0b1hVNGs4YWh6VlY2WHkw?=
 =?utf-8?B?S0dLN21vbk9lcUpyQUxROTFVYXNCTUVqaXVZb0JuZnliV2VJTzNsQ2pPdHIv?=
 =?utf-8?B?anhsbThyYVliSnZmWW5PLytOZzJNVS9scWZrUVZtNnUvaVB2d2JSK2NYQkxv?=
 =?utf-8?B?WkVJQU5nZ1pUYlBnZjFRUG1ubGJJL3RUVVRENEJlSXU0eFN0VnNwUE42ajdu?=
 =?utf-8?B?UU83dDBkTi9XTXhZMEVkYk5HcFl0Nm9DeUxrWjN0Mm45TTdCbW5SZm9sZlJn?=
 =?utf-8?B?NlhFcFdKYk91aVljbE5YR0gvU3JGODlHYUhjeGRyRUZXdWhVVVg0UlFQamRX?=
 =?utf-8?B?cEJBQ0oyYkdUY3RyaGNEV1NWNXh6UVl4YmRKTFJHUHdSL3JKWDYvMS9uU0dN?=
 =?utf-8?B?MVVGK2JxR3RMN2RjdU1MNkxrZjY1TERldVowaG04QTM5aVVYVm95dUx1RzJX?=
 =?utf-8?B?bEtqbWwwNXluc0ltb2JyTEk1YVJUNU1rWTNRUUswT0pOb1dBZVh6MUtFU292?=
 =?utf-8?B?V2lNOXZMczYrOXhXcGVMMkFsNW9HRDd0MGwrSEpLaXIrRUYvb2RsRGRQVHp6?=
 =?utf-8?B?RjZuY2dPVVJRdHdWQ253Kzd2ZXNHKzdiMnFBRzFXRzRhV0hpUTJjdnlKdzM3?=
 =?utf-8?B?T1RsMjBWWlA2cnBoRHV5RXJoU29wR1VaVS9zdml5N0ZyTzduMkRTcVVmMlNP?=
 =?utf-8?B?aVYvTERoczd3TnpsWUdMOStjMnQwY0pPbWRDR05ucjlCbURRbTR3SjZqUFdM?=
 =?utf-8?B?Z2hHandOdTJOZnZtVmdqQU1HRlNKeUVmcTRBS0EwTEY5NkZPbEVzRXN2dlM3?=
 =?utf-8?B?MjFmTHRmQW5QVWU5bkcrV3dkN2o3QTFUM0tHTnBMSjJ6dEh4VTgyVExqeVlO?=
 =?utf-8?B?QWszTDJycFAzNWVnVWhZTWhCTzhQbGNOYjJWR1E4eCtVd01mRHJpRVFwU1Vo?=
 =?utf-8?B?SVk2WGFDNDhTSEk1MkJ0L0FXekg2anlKVURSRnRYR1hGT3ZEcTBSM0xjWGE4?=
 =?utf-8?B?c0N4VjBCcm5jUVd4ZUwzS3dUWkJIMk9jQWduTTVsSFFFMVhnakZvNzVTazBR?=
 =?utf-8?B?Z0paa3FFZElmVmdJR2FOOTdVeHROQUdiWlMxdWVOUnhFSkQrZ1lpNnhHYmw5?=
 =?utf-8?B?aEFkZHhnMGplZllOU2hidGZTSnBCVmJhTXN0blkxUy8vaWw3dkxqZk5qbjBM?=
 =?utf-8?B?M1FhTG50ZnlzTllUNHA5a21HWXFZbjM4aHM4cjdkQ0NRTUJiampBQzg4bEJQ?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1bb234-4963-47ad-07d3-08de22ebb60c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 19:34:49.9572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ir+T2qKmBWQFdPWa5uit+eXezPE5TJnaMS6PO6dFDJ+WyBfl9oJ/9Eh1tiF+03Fe2+/qq9z3rb8Ki56KlDEV7YNo8kIrcvnXd8jeXZObMdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15762

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEzIE5vdmVtYmVyIDIwMjUgMTg6MjANCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAwMS8xOV0gY2xrOiByZW5lc2FzOiByOWEwOWcwNDc6IEFkZCBSU0NJIGNsb2Nrcy9yZXNl
dHMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIDI3IE9jdCAyMDI1IGF0IDE2OjQ2LCBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBSU0NJ
IGNsb2NrIGFuZCByZXNldCBlbnRyaWVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA5ZzA0Ny1jcGcuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDlnMDQ3LWNwZy5jDQo+ID4gQEAgLTIx
OCw2ICsyMjQsMTA2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgcnp2MmhfbW9kX2NsayByOWEwOWcw
NDdfbW9kX2Nsa3NbXSBfX2luaXRjb25zdCA9IHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBCVVNfTVNUT1AoNSwgQklUKDEzKSkpLA0KPiA+ICAg
ICAgICAgREVGX01PRCgid2R0XzNfY2xrX2xvY28iLCAgICAgICAgICAgICAgIENMS19RRVhUQUws
IDUsIDIsIDIsIDE4LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJVU19NU1RPUCg1LA0KPiA+IEJJVCgxMykpKSwNCj4gPiArICAgICAgIERFRl9N
T0QoInJzY2kwX3BjbGsiLCAgICAgICAgICAgICAgICAgICBDTEtfUExMQ00zM19ESVYxNiwgNSwg
MTMsIDIsIDI5LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEJVU19NU1RPUCgxMSwgQklUKDMpKSksDQo+ID4gKyAgICAgICBERUZfTU9EKCJyc2Np
MF90Y2xrIiwgICAgICAgICAgICAgICAgICAgQ0xLX1BMTENNMzNfRElWMTYsIDUsIDE0LCAyLCAz
MCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBC
VVNfTVNUT1AoMTEsDQo+ID4gKyBCSVQoMykpKSwNCj4gDQo+IEFjY29yZGluZyB0byBib3RoIHRo
ZSBjbG9jayBsaXN0IGFuZCB0aGUgY2xvY2sgc3lzdGVtIGRpYWdyYW0sIHRoZSBwYXJlbnQgY2xv
Y2sgb2YgcnNjaU5fcGNsayBhbmQNCj4gcnNjaU5fdGNsayBpcyBDTEtfUExMQ0xOX0RJVjE2Pw0K
DQpUaGFua3MsIHlvdSBhcmUgY29ycmVjdCwgSSB3aWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lv
bi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBUaGUgcmVzdCBMR1RNLCBzbyB3aXRoIHRoZSBh
Ym92ZSBjbGFyaWZpZWQ6DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvDQo+IGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

