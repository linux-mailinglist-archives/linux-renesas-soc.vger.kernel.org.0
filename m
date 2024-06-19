Return-Path: <linux-renesas-soc+bounces-6477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89E90E22F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 06:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36D4FB20CB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 04:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED87237700;
	Wed, 19 Jun 2024 04:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="ZJDO5K+e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE81E878;
	Wed, 19 Jun 2024 04:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718770178; cv=none; b=BKKvNHY73u5ilgoKu183I0efuVUwSzDOuqg3jF8wTaEMrF35SY4Prx68EwKMPF8xUS34mU3ZkX9h9pKwWx+UBn3JEUzQ8yVLVuoEj7QjF1Bx1YFgfs+jL3b5l3ZJW20KspmK44TmKDMh7+KcQ8m5Jtiq20Dphn3Q/SCbU9fSpkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718770178; c=relaxed/simple;
	bh=W/V7hXcR96m5gHFeZUHyDd04w9UerohVBbYWOdqc/NQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k83ctsCTaq6PPdQFDTcGfedkqHWsHw5BYPsnkWFyTlaifMHnwOf/KaL+14NUQxcZqWfBSi0HVZQI8jZcNIKEULwkuBoiojPO/uFd3uJ7QaVOsSa7UI+2PHx8rnhLgT7r7p13cc00c2DRTmQ8z1vQpCGp4FCE6N4hU1SPuGN8cug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=ZJDO5K+e; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J2mJX9013967;
	Tue, 18 Jun 2024 21:09:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=J7mf41VrTlvvXf16ampLWqLyf
	Vq8RItFV2fhstN2xkc=; b=ZJDO5K+e/NcrsiSIdaIeYyAiynwN+bs5AI3PKLzRX
	aAZfkFXEgfhVH70bpIIeiTXCHouziaH0Lrk2P8rTdWuyr/qRUMVtw0PDkgQ0dgc/
	TyiSGrq0xecDMldoL3lesHEIH115OqSMGCqVfY1cMnGNHzZu2hIrBRI0gbDY3zoL
	txayspMTGwThefas5Qk5y1k+zU2otxtYvLsyn3+keC/el9+X5ZelXt29MNnLDZw5
	Q7fukGyECDWUi+QlZQ9KasRAcIGIivkMAHabnMrFUl2+u1WRFkXvmxk6+ec3AuaN
	TI+0MexfdLQuVa9axn+MOgu/9Cxq37S9iDsaDPDdKwWoQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yujajgymk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 21:09:18 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 18 Jun 2024 21:09:17 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 18 Jun 2024 21:09:17 -0700
Received: from maili.marvell.com (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id 1759D3F7081;
	Tue, 18 Jun 2024 21:09:13 -0700 (PDT)
Date: Wed, 19 Jun 2024 09:39:12 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>,
        Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, <netdev@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240619040912.GA1191101@maili.marvell.com>
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
 <20240618115716.GA1186487@maili.marvell.com>
 <8cacac1d-b9ca-4fbc-b92a-60447f8fb178@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8cacac1d-b9ca-4fbc-b92a-60447f8fb178@lunn.ch>
X-Proofpoint-GUID: fN9m-rhZ8KO2XFx_tzdUBi9MzCPhcmkM
X-Proofpoint-ORIG-GUID: fN9m-rhZ8KO2XFx_tzdUBi9MzCPhcmkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_01,2024-06-17_01,2024-05-17_01

On 2024-06-18 at 22:45:37, Andrew Lunn (andrew@lunn.ch) wrote:
> > > +static int rtsn_tx_free(struct net_device *ndev, bool free_txed_only)
> > > +		priv->stats.tx_packets++;
> > if (!skb) case also, incrementing the tx_packets. Is this correct ?
>
> Please trim the text when replying.
Thanks, will do. I had trimmed upper portion; but not the bottom part.

