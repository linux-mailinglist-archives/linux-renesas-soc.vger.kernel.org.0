Return-Path: <linux-renesas-soc+bounces-10559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F59D054C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 19:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E320B21E6A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 18:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DB71DACA1;
	Sun, 17 Nov 2024 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuuFbmsA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C3F19BA6;
	Sun, 17 Nov 2024 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731869179; cv=none; b=hQb4V9YyBIA2X4ACLSmMzomy5LQk9cDONcSkVH5YWOtIgYXMscoyfJL/r+CVnO123VHk31ket6RnHgtAEO1y4DQCpUF62YAqxG/0SXF5IEB0HZSZEnBGkVsbQZw1zqul91cCb5AvKZanA64MISVrLrcQl4dJwpR159l/PkmIdos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731869179; c=relaxed/simple;
	bh=ZuAX6dOTq5fZ6dymYZ0ndr0pKOruoIR3MEVZ5soZmgs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qzTlGPVISuF/tMcl7fY7Wt8a5RvWwg8OEzaI0kwFBPvaKXVXwSajm5aeIih1bsTDQrsZgYD5QQOoxT4FesehEecPjMCEMMqlIGGyGiZDteeN5ZOKTrmR93fUS+BgVp6FKHw+8yFIBU61nFeSp8h4z/5RLmMv2HXej2H+7Eb8+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuuFbmsA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38248b810ffso62952f8f.0;
        Sun, 17 Nov 2024 10:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731869176; x=1732473976; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZuAX6dOTq5fZ6dymYZ0ndr0pKOruoIR3MEVZ5soZmgs=;
        b=IuuFbmsAkR4CxDrxCxQzzIVmutumLs1j/BuklbLQc++S7HtsSKL9Ic9r5vSWTwMDYL
         11TwuSl64kTHp4g1CwhArIiPEJOAnTWXR1PpdZ3oPRl2olS3K7AbdccKkaaV3O9XWK89
         H7EtMHIeYGTmUranwp1nL06RpdhIa6tlA2GVRx1t/sEgOFjU+UA70vHl+e6QYejXRKZp
         whJJThYF9kldaJaLppeEzBDQVbLcvB4obSzBNAb4ARSR3yG5kNOyRocMuL0gY351Qn//
         mHxPWXDn7al5OG6f8u9YIAjqGlGKGqj5xcJcDXUpTtfRLhcDYd0nW6Lp1WyuhM2zt6qm
         BLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731869176; x=1732473976;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuAX6dOTq5fZ6dymYZ0ndr0pKOruoIR3MEVZ5soZmgs=;
        b=xEI7Wh2zog/7e0bXRGH6NK1dL3Vc/99y5nzIthieGYD/rGVsoAf0wsWeqYYougNrJo
         ptt5c52bszLCLv2yi8bbYomWbC1bu+lkHqKGtr6mvcAK48C65zTCGrjbqS+7ggTb8LG6
         E3LOlu16uQunbrJa2V9Hxmd3seE8SxGEGZpQ53xLiLSP64TL4OKPp36sLG3vIrRnpr13
         0CUGVOUTX1v4CRSkMsXnLgUPbCd1kv0TPA0pg91AHeBi9VAmtMLvFxJIEuQTsThtmH2Q
         GW3iYwCS5sGdzc3mk4p0ZzszWkU+uKIQSxJKg4RYdQS3md5rN3ASPGHmDEirhM29OPRF
         a3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbzqMaHZ7vKNWo1AWPof+HS6HhsiWZr2BUH9CuRJm2zGUco8mat4vKBIw5hDWx77zA85Yg/EFVQ+vDgP8z@vger.kernel.org, AJvYcCUrkObQt/YnuF1+w3hwvT7a8TmIUuRLpqqzSkri/0DOtnVL4p1bJVC4NpGgTswSaDRMOBA7Fjxgw//Cpn+x@vger.kernel.org, AJvYcCVOl37ds+k0+Cd3HSzAiGcMp3W2ZHx+OtHMF8INUjxPgxhsDwDW3f19PGX1yWYEG+nWBB/R1XwoKKag6kT8kDNn9QU=@vger.kernel.org, AJvYcCX+cqxLGl3wQXNG4NoiY6ttVBzGhjsuWbmUWO3iqwzU4gGTY1qf0KqhN2ZDAZMvCWOBJVGFJMPl@vger.kernel.org, AJvYcCXGA4d252lP047mh1tf258h9LOUYlx6kar9q1hNPJ3lMsXZcGWs3uOnIs1o+1lcdT9M8Um9cZkh6JQGqxtkWwP2jRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf1RgpgXlXaQKsI75EdyuWVMj/jN6FVDChDwD+mjSNO9Q6x6uM
	YNBciDm163mdJ3C2jM+JmRqsBv9PQyqaVqzCAtcFSnmDfGpj3Y9L
X-Google-Smtp-Source: AGHT+IGQj4MiLznYLc0yMzzGSNQmSxfcskkmVqpy895pf8twonga5yhG5Pxm846pldgya1JFpJXFKQ==
X-Received: by 2002:a5d:64c8:0:b0:382:2ba9:9d65 with SMTP id ffacd0b85a97d-3822ba9a39cmr6003722f8f.31.1731869175639;
        Sun, 17 Nov 2024 10:46:15 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28ba80sm132793025e9.29.2024.11.17.10.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 10:46:15 -0800 (PST)
Message-ID: <647d9131137670859619e47fbfc524158999a9f9.camel@gmail.com>
Subject: Re: [PATCH 5/5] scsi: ufs: pltfrm: Dellocate HBA during
 ufshcd_pltfrm_remove()
From: Bean Huo <huobean@gmail.com>
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
  Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Mike Bi <mikebi@micron.com>, Bean
 Huo <beanhuo@micron.com>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <linux@weissschuh.net>,  Luca Porzio <lporzio@micron.com>, Asutosh Das
 <quic_asutoshd@quicinc.com>, Can Guo <quic_cang@quicinc.com>,  Pedro Sousa
 <pedrom.sousa@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter
 Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Santosh Y <santoshsy@gmail.com>, Namjae Jeon <linkinjeon@gmail.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 17 Nov 2024 19:46:02 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-5-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-5-45ad8b62f02e@linaro.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



Reviewed-by: Bean Huo <beanhuo@micron.com>

