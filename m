Return-Path: <linux-renesas-soc+bounces-10555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 696419D04D1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 18:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E71A81F2186D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 17:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CFC1A28D;
	Sun, 17 Nov 2024 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB38pEvz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219C15C0;
	Sun, 17 Nov 2024 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731864703; cv=none; b=N2LxR94UhTlLQsNOQRTlhWbgmHTu1ghCedBNWF9ahwzvQH7mBGyEnfe3eagZyzIQ/cAapA6mz4tEQL4EUUHoIWQvNQnZCzQ3wl85ow4u7vvOxU5usTGdQbAauOzjA6OREqPe8Ipp/w8OXOnj3LVz0fPtVPJThbmP3DIlqjX5lDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731864703; c=relaxed/simple;
	bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h1IWFzoL182KY/fQ4R7Kg7P2bt7Iyfg+MQPPGeegmumSPh/PRxOpbgkC0WULVXRbIi0ZxFtngoLalCtnaqeAwU0pTY9xdenO95Tps5PpYuiFMnNgp3Sg6CQ5zQAu0gmaXOKDcCnqHKv01ctp+AbhL9U3846iNL7L4v6HmBYP7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB38pEvz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so2253570f8f.1;
        Sun, 17 Nov 2024 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731864700; x=1732469500; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=dB38pEvzh3LILhgDAXUC9JlZjsTXuynrRZssCIP1EYZUbPuAtTDqj6KZfg0fnCjkSU
         hjIpEAB0UG1WK+uqo/R6a79Gf/gCB7a3PjgPPzl9m+DnWd5JcCYmT0iUdL5zOpEKbK3o
         8bwP6Moku+cs7MIE6SwDF3X1iRytCiF4tO/dgwKGGVaGY+m71Y26R+ULFZSfYid/UiNj
         RblUxfh9gfiSZW4FMVZ3ExKBmDSdenU23v/Q8hXRdoFn2W0eZXb2jHxycg6P/harZCbr
         Gwwj5dXgCO/VvnST5FcHnoEdW0a0Fhz3yazD3tZvhkWFSkwQgvfW/ovANN4Zj56vNkXl
         gcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731864700; x=1732469500;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=DkBwPZ5hJouuZydHcCV2uiIgSEG+o9LJ5jry0O0Mk7g0wcl3tuBwfrvmhAQa6ON0+a
         ScR2gyBF6p3bUxz+BFW9k/mtgOEs7OlcJWAYW73wdDCGaQE3JaqXu5/sTG2IchL9iaUg
         v5nZgPXzmmd2ioSvOGEUFlFYFcyOTFL55W4YHYRNJvL3/e/pp3uT3smsnBWx36+n1cV4
         1EDCP/mQD5xZZuq/dgbgMcGZO0XOX81qsDEXBHBNte5UB+Qr65o/ZvXVLBQPDvGW+qW0
         P+T2RgeR+oe0PnE+HeI9e6uzOQ4lqOQAYp4dzDFqkPLyHTvj8akTYG+gvhwVfAmQeNld
         KzDw==
X-Forwarded-Encrypted: i=1; AJvYcCU/r5oS8anp/tyjraNR5kjvqlAnSKxnQHRw07ELG6lBRB2x+7ifbTAPdwpIs6QRxhVe6Mghfva3@vger.kernel.org, AJvYcCU4cPXRZbL61XmanX/h8dVcL4nQCtWz1ew3ZE+OzkE2q/dWjfSCxr5H6fQt1T3BAZDbWLk+D+9Wux9pcLPiA75RZN4=@vger.kernel.org, AJvYcCUAEKaI7v2HwfaFJ17lE7lxVYIuL4CMA4LquKBZzmhWw0Zr4Mv5MptWLRmyLxOxCeMtsHIRldrLBE3Hih81C0npjgs=@vger.kernel.org, AJvYcCWeZgrdvCgj+Lb8/9yDpFe6Hju2TE1dfxeF0ntkC+C2HEZifrtNsw7oflyO4mf6ugQdrQOfVaU3lYXZSi/2@vger.kernel.org, AJvYcCX4Zwb1d5VWDuBmuT4fa4kfn9CLit0+stmpCgTQX7deg3nnYP+RZ0w75xLOVumGHlYf+2BRqI+Q4pWwulSQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxubAau92N+EyC3chUpoNQwJEc8VqJ9GMEVUzNPHXFJL06Md12i
	z0F44XDFf2rBCRt3+OTpXdyEMwOOsbMnIMtpIINz+WWhDBc4mp5L
X-Google-Smtp-Source: AGHT+IGM5AOKwL/Gq+vlCdXodaTvKaKrFRZZ7omamsRPMIsQdxFKGxSowkpEpgRfKiIOKPWFsLR64Q==
X-Received: by 2002:a05:6000:1fac:b0:382:d7a:315b with SMTP id ffacd0b85a97d-382258f0d9emr8122852f8f.11.1731864700227;
        Sun, 17 Nov 2024 09:31:40 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae1685csm10504821f8f.83.2024.11.17.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 09:31:39 -0800 (PST)
Message-ID: <050e354f0d413dc39164bb72262b84b8c2038073.camel@gmail.com>
Subject: Re: [PATCH 1/5] scsi: ufs: core: Cancel RTC work during
 ufshcd_remove()
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
Date: Sun, 17 Nov 2024 18:31:32 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-1-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-1-45ad8b62f02e@linaro.org>
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

