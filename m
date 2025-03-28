Return-Path: <linux-renesas-soc+bounces-14984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F684A74BFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 15:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35FE5883BA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 13:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F225517A2EB;
	Fri, 28 Mar 2025 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="nAz0LE1D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025FE2F37;
	Fri, 28 Mar 2025 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.141.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170164; cv=fail; b=NUoOFHGJJMPv3bh1VWyAUcUAFACanaOJgHDotCghUljHurM+at9oo7VnZRGKhgj9l/D+oNFHzkB5fg55hfCdzBk7Nr9UFgYDTOB+mvOb2j8Ruej0a8BXI0iD9ILEB+AxcJ5p6qXZFdDAumX2ihzebG5UaxcFH5H/Q8Ra2K0q4vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170164; c=relaxed/simple;
	bh=xQ5yexgrHe3nDjt62HbiqS9dICdu9fPJrHbgEd5MPKU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NMPJhxteKIihiwSZoFx4KUjns1MDRUBWTCrtlXkah1BK/ZF5vQCQzwfoJPdVGSxVV6JxnLVx7vTcWFuSjfE+kZ32USyPIBBH810urpQptjHuqwpApUXzF+2aNudO5k3oph6xj0gvF61N7zC1zpLSA1iSgtlVG1DcDJa7tr97ZpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=nAz0LE1D; arc=fail smtp.client-ip=68.232.141.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkim.sandisk.com; t=1743170162; x=1774706162;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xQ5yexgrHe3nDjt62HbiqS9dICdu9fPJrHbgEd5MPKU=;
  b=nAz0LE1D8Bg5j8V3bnoR/vSob0HkeBuOOd+WpQLAtmxN1ntkCXgVz2df
   C9Pn/RKHzxMjw771ViTEQ7KDKzU+EQc94owyyYlfYpn9WM0oFBE63Cvbi
   gvCtDMp/8taaDsESJxIjaOEX23BNgRNhbmEGCeGOqi0Jcszgj1Yq3Isd4
   6CJQEikkDQmQYFrCWP8yvzz+uArR5aTICiY4MJxHuV/cDCHpx+Y/SKWqj
   jqKiUxiBXmX5agIuLVLH98KBC7XzdPkxW7AqCgRVOV60cpCEd7yanJ/8i
   +suk5xU+Fh4ZbiVPEkDCc3Hx7yK3Ywv9f3/4mDVsesgDfDcN3VRMtM/2K
   A==;
X-CSE-ConnectionGUID: bo4NGCCuQeKDPqe14UTIxg==
X-CSE-MsgGUID: kuFKAO3OT8CqZ0f1t0dCqg==
X-IronPort-AV: E=Sophos;i="6.14,283,1736784000"; 
   d="scan'208";a="62666075"
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
  by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2025 21:55:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXBCGMmlfLgWD098EY2kSAIZwteHmffvv/O5HiKAkMI5IQuvIaBYqtOCtLPQDQo9IIma/8U+3vkKId6UDsKJQiANMH7nTlV1Wb44nXLJQXGgRsjFJia0ODIN0WbtZqMf6Lk0KxdhZVX6OVS2kYLQNawjEj54pXZoDWXEzKsa3kXUmGgMB/lXO8U0rsxTC/kSZBq0qV3rEa0LwgcXdx1FWfiMVQDrTVWz6HayHKvnthNDrSr07BfUJtYmzu+bk/9JjDTZtQe3XI10HDVkEcBjCt3R7rwKRTMcpRNY4FXc2Ia/qx2XbgLWsPIpE0aYfispC39AAXynt+sDDNT3J+4xVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuijMPB3rS3EQIsQzQgvHUdUNaS0ixhjwlOsdPdDfQk=;
 b=Mb5ve8cuLVbmb4cmQPkamR4yIPitkn0XLptuEz9pykoGE4Sf7olKxmDB6pxZNEZA/3ScbA6xLCoNl+EjUCw0hy/0u/xudh7gGC9fNG3PXryCBYtrnvlmHYfXeI5R086zGFbTxJXipXG/1FpED3RvP/wPcePsLkxbxwYzIOTJsA323FahCi5inD2vEB0TWDp/uXn40V9hL+3QoEFUdTPY4Fn7J00sMs7OynEa7rZprn8g3aPCwODIpj+6h5pjQ9TWUHP0EwKUUml07NFeIWMXclmOqVmgNrxYFuqoGplgPsm7qIMUDlsjhgSiB9dotSY1S3dfv9VS51x/8xbniAmDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by PH7PR16MB5854.namprd16.prod.outlook.com (2603:10b6:510:301::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:55:52 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 13:55:51 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>
CC: Adrian Hunter <adrian.hunter@intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/5] mmc: core: Further avoid re-storing power to the eMMC
 before a shutdown
Thread-Topic: [PATCH 2/5] mmc: core: Further avoid re-storing power to the
 eMMC before a shutdown
Thread-Index: AQHbmaCawHwbneBGskeSsoXKbd915bOInhfA
Date: Fri, 28 Mar 2025 13:55:51 +0000
Message-ID:
 <PH7PR16MB6196C3AC7A7B7CA99A70E7DDE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-3-ulf.hansson@linaro.org>
In-Reply-To: <20250320140040.162416-3-ulf.hansson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|PH7PR16MB5854:EE_
x-ms-office365-filtering-correlation-id: aae5c649-0f0f-450c-5ad4-08dd6e00408f
wdcipoutbound: EOP-TRUE
wdcip_bypass_spam_filter_specific_domain_inbound: TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GETa6diqgjDMNprSLiJ/lc+bVhOTtpEk9onXuN5nl9z06ga1vEzZB4jV6dWS?=
 =?us-ascii?Q?nnhWOcCJYEWRK0+f3r51xh90c+j19w3RdYAanl/c8NSMhAOeqIMiTmVNvNt3?=
 =?us-ascii?Q?CeqkzIi6q+W1du9tzXty9biPVKB7oyY6AKIfV0Ml0OEgRDyTSv1mfdRtlCTb?=
 =?us-ascii?Q?wzLerohozja1ufjTLjjf60u3sfkJiuzYTzRAUSG2fhGoOFNfccqrZg8BlUEl?=
 =?us-ascii?Q?bQPyj7StLLfyhkGkLwpQE2yhR8oPklIhCwVCiAoHWQf1O+hc+pcudR88eAqR?=
 =?us-ascii?Q?OnPxZ0zSG5VzPwmiyKLXsg/te5J9uverh3SlT4GEGjCEqvT7E7mtUTSqvZtR?=
 =?us-ascii?Q?Mm6IhQftS7kmYOE4hWA/pZ5zOjEOLmh3StPEYIrBJOgXAjHS4IBr3mWIzZqX?=
 =?us-ascii?Q?BusS5mf4jMGgzhATeDVJlBcSQpTQk0ScXF/hrGAYHZ2tAcxA9YTHfGFXRJwP?=
 =?us-ascii?Q?pKjdLhqSiwWEmhuraP6bTlc93Im0I5TMdq6aCdwPpFZuwwKB/oOG1JerT/U3?=
 =?us-ascii?Q?OYI25T7S9Ft5EPIVLVef1ht0V4Pf0NF26bBE1Zb8pWt6FFi4fXMR0hi3OxTm?=
 =?us-ascii?Q?QLajEnEEQiqmDOLlJgzmkQVJDWHASRfOQOz7LDTE3Gv4JQwxt8rPESi4R99Q?=
 =?us-ascii?Q?lSBRnzMczGNzwUjfjx5X332bVDUadH6BEbnqvgdx9JnvbzSoHGBAkcxwQcYv?=
 =?us-ascii?Q?iFYqumM9amX/efYDGrTFoT+upbU0YsCHA7/kI465CzdYVDCQ94DKxCMD/MkK?=
 =?us-ascii?Q?DGTMrL/lBuAs+/6jbinvl+ouxq9seFtLdTRV3DYrOBY6c6NeFdtVyOlIU73H?=
 =?us-ascii?Q?w5ZQ5B31aIlMenyery64lK8sa3ircEC7MumoEhZJOiQPEq3JslfbU8nf4CnD?=
 =?us-ascii?Q?8oySxT+YpMDHWliSVqt7d0otM49ADumACZRbuHjm4QYGl+6/nV4cel0ha0wU?=
 =?us-ascii?Q?1i6Fvh18o6mDDD/LrmhwAubs2bFbHtsfTRaqKxb/OmZKcCQfMHg/kI4udpnp?=
 =?us-ascii?Q?rCiVYrpxLo/Fjeh5ZPEF4uSdWQLcVZ9rvRSasRujKUeu7A14CWIk6gTCNXjQ?=
 =?us-ascii?Q?47o9CwD1yVuXaXNsaHw/ANnXaspdMGzjCevpAM3Hp29v7epNY8mIlRQv0dC/?=
 =?us-ascii?Q?gR78Rk6u9JgytXF99Fc5GaTJN0v6JWnuNdEs2eOkKiKcqiZ4UBwUezeQzxHn?=
 =?us-ascii?Q?In0WU5bShzPURH1zQqfWvDLwm/pxRCCDiAZvsz2P1oSrb16H1GtptP119J8G?=
 =?us-ascii?Q?W7FBI2GLw53yUX1mjKMZtQxZbQjSeNV9sVHwHkrvjwrznnaoOx0O6oVPLD9Z?=
 =?us-ascii?Q?fk+RTK1LweIKmCLxk3Ln6WPnjd0fxJSgIzAtv3cEjB/9VSv3kJB9Gi0+yN6O?=
 =?us-ascii?Q?LDcyO8ExdJ5l6wJAiGbEVXJjBdBj6/n/fCiKjR84cVue632bJYwqp8iTWoJS?=
 =?us-ascii?Q?LeXuakeQw0TuX24YJUd9+oQr44dnLjvW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MrjOUmtYzWrtDxJJtohM1IzFOvRipV1ZD7hZEeXE6KuaZyCmbwqQ915Mg8Ba?=
 =?us-ascii?Q?O2s6WwylV+Ys7VwJI1t8KT/uMx6JxlMDI7TITDcTxLLkP/Tc2+T8F041oIpf?=
 =?us-ascii?Q?qGSrwngkKqHPFV9NhCVOKTh4tGzv7k0wvudIkxa9hLjFGCPBR0YljG2Wrvyi?=
 =?us-ascii?Q?RJQcSuhyHm3ZzZ6LNDc9648juWryiunAmUZRECAD1ngF7Ff51Gr7tM5MjOJe?=
 =?us-ascii?Q?an4vWasBl4nEHvqm5Irll9HL7kQ2oh9+ltX6RlcxrTaaUYgGc3lj/9ZStQk3?=
 =?us-ascii?Q?ZigPASgmtc1ofsVF7JACBEuovuJ7tZ4GQrXW2mcrIP4+/to5MZ/MexDPUfVd?=
 =?us-ascii?Q?IgkYH/tGSKSrIkCbTPH9cyNUJ2D50aOIMS5BHCpfdOrQYBdd1rUdqku/2eAG?=
 =?us-ascii?Q?F1T70xAVa3IJJlZKie7uCvYyAY1F/KCRqUKLAWMpWLPq6zBlunHzi7xRhKAy?=
 =?us-ascii?Q?JvD5q/XRQKVPCbV5gpZH/bmX72tIRmUskIqJL/ZHnk6x+EOXBSnqkmmkQVRb?=
 =?us-ascii?Q?BwhGnvOZT9aXvOwf3BeCzRUHu5spXoczN2Oz/70xtpmsSkg0S2Vdkzs8+pYU?=
 =?us-ascii?Q?uOh44N2nRpZCNrQHjEgyPMbVgUg6E9fe5dATu0zr36vMhHpwXzioEqHZbI+l?=
 =?us-ascii?Q?2V5DyLzHwxelJfM9pxWaJsbwfv60A+0p2ZHJ7yCTvxkMIJmOANw9QYSk7eiF?=
 =?us-ascii?Q?hMKE3yumQWmA2lCEAwxN7PrkpMjxPayk4ishjuLMiu1HN3uox8K/gmZ+F/2B?=
 =?us-ascii?Q?ZnMahoZ/HTxiVaOHpzJfK7rma0sS3G8r9Okim77HehTqNIqkyxh4aAkb1gk5?=
 =?us-ascii?Q?UI/DEJe198fkDXEMHm9oKjhOFrqDIW3LnAu+Q1gjmlOMO5n692cbL2ji+k/i?=
 =?us-ascii?Q?DjxnNoRgmlcwNxOkJXhrNDSKWYHT9qII8pzeUwj1DfSsjwbe3NsvuFBRvHGx?=
 =?us-ascii?Q?HCJroP/pzP3S4sNRvmcsZHlHkXAfJqrDrSBzenaJL763H49jGlp7A8rVNVaq?=
 =?us-ascii?Q?9CRqVMDQlJVKFT7kGzQNcYKFpuowSL6/+E78CTQz6DisReQ1Wd9Ac94IjNB8?=
 =?us-ascii?Q?D2LAkLajLu739+3CM6tpKV2j3L/btnJnYM6ka2YrcB1J1eBto0stu4V0ZOMN?=
 =?us-ascii?Q?ndfQT2dwnCthaHluII3TKx29pUCwRROjTBfBvpSN+cWkDmRk3Ul29i+XQfWV?=
 =?us-ascii?Q?5vy0+ynQ4aUzlRWPJ/RFA03K7uj9UBIpcYJYr0nIgnogdMC025spxUbn01Uy?=
 =?us-ascii?Q?6k5mxXbt7rDTq/6YEVM4FtM1b5218F98Ln1SxJUO9PmbkcVUHZRT/ETz6nTr?=
 =?us-ascii?Q?2zFyGn93+nbULS6JeoWHMeil65d8mrAJeT1YrM26W+z2Wt0qVVqJVaN+Iws3?=
 =?us-ascii?Q?3f5gNz6u2wuvHxOuYlsiqZ/zJU/kOT5yUMAVJR2UpEMOMw19TK2hZD99gUtC?=
 =?us-ascii?Q?eCK1+ecOOqAkPoS3G47Lb37Ti/dCKo2uB4aUxFfQ9jxYkkEbmvTH5UDf3qdP?=
 =?us-ascii?Q?i4UZ4fWwhZ0llqIJzu3E+Q8Ahd08lnJoS/pMuG08oLmoDJ4/kUZOSd7ohYmr?=
 =?us-ascii?Q?49J4XF2kex+iTbDOlnS2Gaua7xOUMWIphVbs1HiS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vDkICp/VXQVf3c7SYzm78Gb01KOVHqmZONWFCGUtE7eo6oHgM/YA9RwibIe90Y4MrqxRKBF1inBDWYYRlpo/YEwzxv6a9/cxSOznqWZXq0ae9E3sLlbYLet9w1XlGoimQliic1EQoiODmKc2hYV16U23LVswExU0TFSVhji24jhoffHhc3VeCLhrX0raED6k8TIaP2a2E5uRgbB9gn07C63gr9OzkuI5nWnuWE/d89hXgZtSK9IFd1J9TXTLSg6iOvNwnTYdiW7RZqMXkAGKbWRBiJv7FwB5Of7haK2gj+EXd1jrQNWlH0QILbC1u6lhvly4vrCCfZgvPslQsalMxRhs9NGJ8un4TPRoAtzNqkeD2C+yw7L3CcJiApGTT+IRskIrFR5VZNlLoNyZElL4mChrhrZ4SVSOXQ9i/1JjrcFREhA7l8HVe4sr8fu2eJV/fu67vsGwCQSZFlh3V1VPajsOb5Sktbr3kasrt8cP6iVRLs2EyV05KfGNPb+PpSM//19GPE10lck8WdpIdYtGwHNdeNd7Dv22INsC6syldAun1qKwskP6Ebueo5tdBmRzA6dGBqk0m90KPtB6V3GYloE5xBMDhgOpQ1IhkgAVC6TXKZiwPbjeZNUEw98aQ5KTc+NWiB2uLe/X0ySXWsPJ4g==
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae5c649-0f0f-450c-5ad4-08dd6e00408f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 13:55:51.8621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D453mPOjN6Qa/C9ZMxb3XCOStPBXkdp8c5wif08ko+/c3N2ZMJcDdXSpOd+UKAAceQ1s+HS6jk8FaPFU3Jropg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR16MB5854

> To manage a graceful power-off of the eMMC card during platform shutdown,
> the preferred option is to use the poweroff-notification command.
>=20
> Due to an earlier suspend request the eMMC may already have been properly
> powered-off, hence we are sometimes leaving the eMMC in its current state=
.
> However, in one case when the host has
> MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
> set we may unnecessarily restore the power to the eMMC, let's avoid this.
>=20
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/mmc/core/mmc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c index
> 3424bc9e20c5..400dd0449fec 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -2014,6 +2014,18 @@ static bool mmc_can_poweroff_notify(const
> struct mmc_card *card)
>  		(card->ext_csd.power_off_notification =3D=3D
> EXT_CSD_POWER_ON);  }
>=20
> +static bool mmc_may_poweroff_notify(const struct mmc_host *host,
> +				    bool is_suspend)
> +{
> +	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE)
> +		return true;
> +
> +	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND &&
> is_suspend)
> +		return true;
> +
> +	return !is_suspend;
> +}
> +
>  static int mmc_poweroff_notify(struct mmc_card *card, unsigned int
> notify_type)  {
>  	unsigned int timeout =3D card->ext_csd.generic_cmd6_time; @@ -
> 2124,8 +2136,7 @@ static int _mmc_suspend(struct mmc_host *host, bool
> is_suspend)
>  		goto out;
>=20
>  	if (mmc_can_poweroff_notify(host->card) &&
> -	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
> -	     (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND)))
> +	    mmc_may_poweroff_notify(host, is_suspend))
>  		err =3D mmc_poweroff_notify(host->card, notify_type);
>  	else if (mmc_can_sleep(host->card))
>  		err =3D mmc_sleep(host);
> @@ -2191,7 +2202,7 @@ static int mmc_shutdown(struct mmc_host *host)
>  	 * before we can shutdown it properly.
>  	 */
>  	if (mmc_can_poweroff_notify(host->card) &&
> -		!(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE))
> +	    !mmc_may_poweroff_notify(host, true))
I guess this deserve some extra documentation because:
If MMC_CAP2_FULL_PWR_CYCLE is not set but MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEN=
D is set,
!mmc_may_poweroff_notify(host, true) will evaluate to false while !(host->c=
aps2 & MMC_CAP2_FULL_PWR_CYCLE) will evaluate to true.

Thanks,
Avri

>  		err =3D _mmc_resume(host);
>=20
>  	if (!err)
> --
> 2.43.0
>=20


