Return-Path: <linux-renesas-soc+bounces-12953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D6EA2C4AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 15:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A73221623C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 14:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495C82E40B;
	Fri,  7 Feb 2025 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QBU6Fhwk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D777208A0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Feb 2025 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937166; cv=fail; b=FOYKeMQ2/6y+TgkZZh5koB8Wx93wXwGhk3uOCKUE9CkCRxt5klo2wlrdlJ9SzCSgAn5TF21py7wZ5Ci4sobfCCHBajrSrfW+ox54ikm9uq0LphIB+IwJCgIC956x3oiTed5FYeN0C1BCxostaF2E66f1PhW1ekVhnE0n4WlIQa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937166; c=relaxed/simple;
	bh=/6lBWRIWEMWwpI/N+OK3wtRKM896AKdUv0pblhV+NbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tfYLVNUKnj708I0iz8khLKqCKUsnsryfA5NypI1bukgB+lYqC42ejpnZHCew52BBQ4uRIL5y8UE9lj23eF38fD6NB8M8cMk3NDl+Dp4UZ+QVsrCIsXCjaV9v566AIHDZqcZ/QJYWknzhtB3W6A6mdTzaVBipda7e4HwcPprNjTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QBU6Fhwk; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+/iqs9397XLNFEDK8Im3qcrvZXKIKTD8ZZoJqrGyg9tww0yaz2VH1gy+nvTrHZ1qBWTOmPVVSUr0LkhHkocpkH5EQiCuZvkOQZ4zXrFF9O/EXXzPXjaczjuOZRx7kTTapvA4lSvPCY0fyscVB7r9MFVV3Wtl0Bgfpq7voK95dsGRCm/JOrfq2U6sVD8CtBWPzrdc3KpuxMl+zqeaj/RSJq3TSCpXX+PMHzUsKfejXY7HbqAjqrGpRZhDK90FUP8ErXlZvxFOT/AsceFap25R2DP6J9ilvVTpmjhi4ZyOtMkkm3falzCoVjtho5fLic4ScdoVWN+BWTlbZeNCaRuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+BkbNbHwlPLv8+gvUR+qij2H6/csenqVauDNDC4FjE=;
 b=MdjfXIYflboryh3VV98BuXiZREY1LDKfv2hMi9pp8XgEkfR8l+rP1ZObGzEYXXyDtPjj5uGZFVu5tUa2flEVe7yf1ISDyjFMwlbcfDybv4l9ZBQPeSVEkMMqIP7rgWbNai4Sl3tL1UfP1fKf7PTVxwJy/xbQyE8HLjg/NDCOURUVtcezBXF3iN9Uaoaj6rGgXHzvxBCaaEpR6fjHJo6FMB1tP76jjRUQd80vQ+WMvB1rPujWkqEJ6VEGVaNVU0W47tysGpPMoh6Mc6RbBNZ5qdmtIyz/01nWFURcgQ2Vs4yNNmx+T+u3DErUJ0LxM1rFouRxTmBEooE2b401r4rUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+BkbNbHwlPLv8+gvUR+qij2H6/csenqVauDNDC4FjE=;
 b=QBU6FhwkadvFOE2ivJHHrhKogCfGkKpvlyf2ZJDrV04UECFUA61dcJaDW+5kP3UmU/pIA1tV3NeUM4J5w3UJtpDB8hMWd3J1VDOizWLUfAxOCA1nCvWnZkbh/snwe19Oa0IQlW3ZDpFZRKz8RMhC+fxuHHLudKcn17e6v+k5YfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYWPR01MB8840.jpnprd01.prod.outlook.com (2603:1096:400:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 14:05:57 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 14:05:57 +0000
Date: Fri, 7 Feb 2025 15:05:40 +0100
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/14] serial: sh-sci: Introduced function pointers
Message-ID: <Z6YTNNTa7xoQ0bXW@superbuilder>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-10-thierry.bultel.yh@bp.renesas.com>
 <46ae969b-f24a-42cc-8477-70d9e8f8c057@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46ae969b-f24a-42cc-8477-70d9e8f8c057@bp.renesas.com>
X-ClientProxiedBy: FR5P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::9) To TYCPR01MB11492.jpnprd01.prod.outlook.com
 (2603:1096:400:37e::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11492:EE_|TYWPR01MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ccb772-e462-407e-ae6e-08dd47808b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rMAUrtxJ5GX6hVbDxSDKzlqVqv1knL26Q++sdg8b8fuWJj5KB1jIvq11UBHc?=
 =?us-ascii?Q?fOv+5xQr+/GCFzt2zDRZj32REAZLWFQ0axYHwdD0X7i5jiCAek4M80wWaYeQ?=
 =?us-ascii?Q?g7IhSA/keqfgsB+cD0Rk9Ywv15B1Pjzl2Lg0sikkB+bcCnIEKswlBA2n200/?=
 =?us-ascii?Q?MBfw3qTYRcGAvX5IznAohJnfhwcyjF/QO/qhxZdkCFa+OBpc9lpGTbiZuBQC?=
 =?us-ascii?Q?bTaqDNa5DRi96sdfchvRLCFk1vqL0Wz5K/+MSB90YGN+vYMhuDdx4XCpuK0S?=
 =?us-ascii?Q?sb1c+ZrdVlH0GHcs9Wy9wF4bKhqBRSjlebCc/cieGX2uXlLG3z7nKzsnwtmS?=
 =?us-ascii?Q?QNvFECz/aXukmzZ9eo47pKD+TNPidF4hhlbMw8+pNdwXSMEr5EhNQ13NFVJS?=
 =?us-ascii?Q?m2dZ2bhM33kac9Fanx9AnakdhNbyUHWaJaO3naJldS++IoiCUQZ2SiQJGw52?=
 =?us-ascii?Q?y1t3Y5jxo+I0sLO2sXSt6FwR7VpyTV89IeAIt9vjabJBeSZkyVKHGNQNoOKK?=
 =?us-ascii?Q?uLHLb+NX9jUnclAXUFJ7bPUjle+gftl7yhoHK5xVYfy+YBHqiNUNpT981UW5?=
 =?us-ascii?Q?7aUjbeuZ2gZRTSYchLA/InhLvGpjF0uW7avxIlUnVLst4sMMNuwQeP2Oe5dZ?=
 =?us-ascii?Q?U/svOX+kp/oWlLuKfWcaXlSeBDYPMFO2lT+k3UfN/cFlk2HQx60Zv962sa0Y?=
 =?us-ascii?Q?QDSr5qlgX6aactWVvwAbqUQZpJDKqM6rAeuGTqB1jDDJtTxZix2FMII/cfY7?=
 =?us-ascii?Q?DuyepnRjUgJQ3pDdDhA5/9Unck77ao6tTOlY46wosJiD75hVk2ZFRNzbH0+F?=
 =?us-ascii?Q?tIqQoAf+vN/ZENxjDOItQ39HYkuaH2RDcZFWFmHHYU9V+0SFpHOWOB6RFzL2?=
 =?us-ascii?Q?SBRTcSaiNErGS7O28U5NxeVDKNhSoxXrqpC1wZ9T5WbPFgt1GVpAdlfo0YEQ?=
 =?us-ascii?Q?zh7+63qFt+Xeku5g82ewN/SZ4q/CXs9Xf/VGE91hfVQke3eaQuxNuRW7Mqfy?=
 =?us-ascii?Q?mvQmwFFaLyzoV2JkaOQhAIam1Nmfyi85XfyJoLe0hAkAUm6g//S9aN40IENW?=
 =?us-ascii?Q?2fYXkOVE6kJY5AC5006fg+kfFcIrRQopKp1mDizyOU3eTxBZ0m50qK/NC/Sj?=
 =?us-ascii?Q?KFJgZyRuPMnNE/Yy/qYh6F9Y+Aaj2u6q10E9cIy2XfdfWbrgerpiHf3jNW5C?=
 =?us-ascii?Q?x4WmLfuKmiPmLEY4Z+I45SnvuwXFjbKzCyEubonU3g+66DXA3byCVTgTWVP7?=
 =?us-ascii?Q?uG3vI6bJgchkXXi1jrq0dB7XUDWuJSzUZ900R/97vFRaSDtm4dVPhWgvSz3i?=
 =?us-ascii?Q?Cjq/FSk25jCJUXz6ZztyeZIHxONZdXcSt7bDikyFp3ouuhnYT9cmsmGr9NpY?=
 =?us-ascii?Q?DgOA6mFWAJ0Cm7Ooo68ZAuAODE5HPswBwXGMj4qArp7mX81aTRdQb0OiqsJz?=
 =?us-ascii?Q?eouzP3T88k/lo9ShtX17qw+We9J+WeOG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WKiKdKpxwXCm2Zw4wknQZk6wFy8QO4i8KlQqba9luwirNgaCUo3AtW0PjvI6?=
 =?us-ascii?Q?UhlrRscRi+9CgTsklUABfPkGheVLTOcMc6gLhAZ2wprmjmSb7dZNTwJI2gwA?=
 =?us-ascii?Q?eLagxVR0lFu2cTi+2E79teloSRMYFHkmeJXQBs2W7MMu99rguM9qXOyIUnIr?=
 =?us-ascii?Q?fsT/ps6vn6DE33HlzL2Fon+LHAvtssMqUcRp3HlQM3uifnZD3i41Ryi9veiY?=
 =?us-ascii?Q?Dgss1+P2+HmK4qf5YbFb04wk7qmZGCKIRsALhHYnTIzEBmhACyoXH+h/ROdO?=
 =?us-ascii?Q?L3guakqb+uce5YSyam0lWG1Z5m4qOvWaH6GcUrNSF4ONPnsFOWGRA9RbdzPP?=
 =?us-ascii?Q?IJgH7XGnMot0OjGM0W/GMreQkfQoBQCTpmlZAKlxeJHgvuECednaDviAdlOb?=
 =?us-ascii?Q?/jcGehhEi+acFqrD0Z5NUFXAmn/MtkKSIJm+PE2D50HC6KZGvckc1oEWNP4B?=
 =?us-ascii?Q?ZBlLrQApwkWL1c2jHCRNvUzr5FpJ+oYS5vgc22vMvMC1JjKm6SUQXQrafSBz?=
 =?us-ascii?Q?ukbl+v8EdvjjRtdznZDkssuNq9kNfIiwxIHcqzjhBEdGBAt3SYxmOeWvLct9?=
 =?us-ascii?Q?jFFk6btgfc6IZnp1eDF8u/gaie7lpP+ryKwKnYrr5NYvjXVPv9hjppZ8BD+Z?=
 =?us-ascii?Q?qQ/g0zp/UM/2Uc2Dn2QCi8ypHn7aMHoL4qBb/7JarjlnYJhesATrXH4PNxJW?=
 =?us-ascii?Q?vzHvu+5g/YQqCALzJ8yA+eSagkgcCCRFFHcI5dFfNbo2SxRVZfE+Obs3lxV3?=
 =?us-ascii?Q?MlIraQ3Ddrsott8uWThqqkJ0Y2vDCg7nWtryp7M8Lgub3OfResRcsTxTxkPZ?=
 =?us-ascii?Q?ZpD0OqH1/RgA6JHIgDdzVPK4Ig0jpwmE8hvZl6IOFBCQF0kDD10QYjxv1nB+?=
 =?us-ascii?Q?fBlF8uCHV9QgsLF5QQsyOA5tfg/xprbwwQhfJfDCLiDVr2/QTlmrcy26KroY?=
 =?us-ascii?Q?0OKp9L9si7PeIPzKwJ+/vxltDSM506rDUo2pB8WgG+hHaANY505JKPexx1eo?=
 =?us-ascii?Q?YNegBZXLPiYYIlJPahRR039u90eCKjaCpGvpHAqKfCIzihiD5WA5EFhB7R2p?=
 =?us-ascii?Q?CjV2gAcGXRrLmK2geVs5+ju9bceYKqvt9Bh0sO9QSbumoAFGJj9tmPmCHiTg?=
 =?us-ascii?Q?iZaaI8ul7/Y26eaWv4eKz048I0PNisvq6JrXisGjaRB8x3TEEU98T+jlyN4z?=
 =?us-ascii?Q?KILZh3SHdnHksa3rZ8gn1Oawtx15WQheVPAD4fb4cg3Hl9ou6RatlcWUXPBa?=
 =?us-ascii?Q?YEFkyiNNwxmWfWr0O9PtjdnsgaokUJsiJLl4xVxC8M1XS1qHcqGniZlRtTCw?=
 =?us-ascii?Q?SZiAcK0jGczlcWmtoRof0NFFOij8q7jEa22cAsLjKjkcfttknYKKyHsu0kEP?=
 =?us-ascii?Q?RacVQFjH3nFzcM0OpBYDPvJlXXsIp4P2YwFQbllUl7q3K72jEdCQnhODkfVD?=
 =?us-ascii?Q?stveqK1iL3DeDHQF/tsdqMXf6+Dhc4yom91UqcapMGeB6QYVYEPme9y8UJDs?=
 =?us-ascii?Q?O19gHvDDeyTucdT1G6Wi71iz2kDdZNXuzjovEj0qDlEQiL06/MmqNbBQ+tP1?=
 =?us-ascii?Q?W+Yh42vSLW9YOy93i6slnmvWv4MEy/1D/lPvJpO07FE7BU5aSJOU5Hclr85w?=
 =?us-ascii?Q?DvvY6t9RpRP2MrMd+U7wzkQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ccb772-e462-407e-ae6e-08dd47808b2d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:05:57.3746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MjhrBuv+JjzCxB6yYSLqQKyEPetb9MevKooMrKpFeSMvq+HGlPylZYFEOjR+Nt48q+iqx2MPMnU1PAV3gh//Svt/FyoqzJBfztg0nK+3MCdqK13aUASq2T4h4SKWEoA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8840

On Tue, Feb 04, 2025 at 06:04:57PM +0000, Paul Barker wrote:
> Hi Thierry,
> 
> 
> > +struct sci_port_params {
> > +	const struct plat_sci_reg regs[SCI_NR_REGS];
> 
> I don't see any usage of the regs field of this struct - is it needed?
> If not, can we also get rid of SCI_NR_REGS?
> 

Yes, the 'regs' field is used in sh-sci.c, most essentially
through the sci_getregs macro.
Notice that the field is however not used in the later patch
that adds rzsci support.

> > +	const struct sci_common_regs *common_regs;
> > +	unsigned int fifosize;
> > +	unsigned int overrun_reg;
> > +	unsigned int overrun_mask;
> > +	unsigned int sampling_rate_mask;
> > +	unsigned int error_mask;
> > +	unsigned int error_clear;
> > +	struct sci_port_params_bits param_bits;
> 
> It looks like we always initialise param_bits via a `static const struct
> sci_port_params_bits` instance. Is there any reason we copy the contents
> of this into the sci_port_params instance instead of using a pointer?
> 
> > +};
> > +
> > +struct sci_port_ops {
> > +	u32 (*read_reg)(struct uart_port *port, int reg);
> > +	void (*write_reg)(struct uart_port *port, int reg, int value);
> > +	void (*clear_SCxSR)(struct uart_port *port, unsigned int mask);
> > +
> > +	void (*transmit_chars)(struct uart_port *port);
> > +	void (*receive_chars)(struct uart_port *port);
> > +
> > +	void (*poll_put_char)(struct uart_port *port, unsigned char c);
> > +
> > +	int (*set_rtrg)(struct uart_port *port, int rx_trig);
> > +	int (*rtrg_enabled)(struct uart_port *port);
> > +
> > +	void (*shutdown_complete)(struct uart_port *port);
> > +
> > +	unsigned int (*get_ctrl_temp)(struct uart_port *port, unsigned int ctrl);
> 
> I think we need a better name for this one. ctrl_temp is just the name
> of the value we want to write to the control register in the
> serial_console_write function, the name doesn't give any clue as to its
> intended function.
> 
> Perhaps it would be better to define a prepare_console_write operation
> which modifies the control register state and returns the old control
> register state (so that it can later be restored). That would result in
> a little more code duplication but it'd be easier to understand.
> 
> > +};
> 
> [snipped the rest]
> 
> Thanks,
> 
> -- 
> Paul Barker






