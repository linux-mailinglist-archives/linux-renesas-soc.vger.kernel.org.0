Return-Path: <linux-renesas-soc+bounces-10558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAABC9D0543
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 19:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74113281C4F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 18:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7421DCB21;
	Sun, 17 Nov 2024 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfwDXHOx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB5B1DA602;
	Sun, 17 Nov 2024 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731869102; cv=none; b=ekoq7g20Lv922ZlTffzFp7C4P10WrcX3duSv6jV01M3utOAB1MLxVA9ZnqJLHTT6iJ2k2ymQbXRKHB33WMPKw4BEujl2RGfiwFwFrkGtmnBlYgV5osgWDRJ2jI7DdXrPjRUHJSrXb/r2YsoklAL0b9ivnMXXbdO/AtbFqD6YhOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731869102; c=relaxed/simple;
	bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAnebm/dYt97C6YnRqQvrOW/8EjJR6uGuiOFVgcgFCTQRcQg7kwnqw8XypyRLK4eXAHQVeBFWL3wn3z4r+hA5U05B93rV6AOCi/MoCTcOML61bxG3IEWgeV49BA5KCttBRxrGztc0euhqSo2BnnccMOzwfL0MKbGQCX5QfCpXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfwDXHOx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43161c0068bso10635025e9.1;
        Sun, 17 Nov 2024 10:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731869099; x=1732473899; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=UfwDXHOx8GD/Y/EAwcFkJvnXNfIfk5wg4CUkNI20uXn5cW44eXTwSXFhAoBUb/2smW
         Pg+ToEOZWAqgtbWTj/NsEE8MN2rhWsr7G+C+2jdRmF0WWrSR8mMAbQ/oPukbLTW/3Syy
         /u3apPRDKXB3vL4nP070+bQITOFtgyeYKnXPyYhaqjW5efrtr6rdfgzAJj6+ENdxO7Pq
         4WHRPzR+qY1K/4dGYoVkLEsd5xmRNiXr6zumC7HhCifjKDU+rTU9Ut+/SETOJMCxBpN0
         Srn+hJW9nLG673NbDSBkLhv6NPkndGQX6xhmlHpVRynMGIkrxRU/YvYh4NSlUe1FTEwP
         VatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731869099; x=1732473899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=Gn5JfxsD+drcvK4CI/4+qcBcRH2hz/30DRPFkcjqqlEvEohN4OxboyzRwTkegWMolw
         dVv60MoqlO0joaNdmRLQkWUDsidYnxrIpuOdCl/QOzTPEqY130jcEjsYNYczizTiwhcV
         83SeAi8+3IWIGqzswJFY9rR6ok8YvQKhd/mEFG3fcVByzBJZ94c/aw9srJj2KmenI039
         R7h764gjEtEfxpbSxcexZLNNOTETYPCVAGoQ0u+/rMltZW1ZzM+XHa1QCS988SL2wpWI
         bLUbJv7zgSNlaB0oxH8uuTxKYMZ62FwqpOrY9HTuEeUyxDnHsL3UPyCeyxOBcrMwzhjY
         36LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRrKlJne14HUVDK0ZJZE9I2MtBvVb+VzxSMDNGwVIzjix46b+o5Q2DYIaqCHdc/KlEOQADqSKlPLxn7yVU@vger.kernel.org, AJvYcCVeS1M8voqHo/OzyHyGiYge5GCzPmb519X7vGrwS0Wiz5vJCAGQheU+NZTYUmAHBE3dmSfw0xXW8l90NLK2@vger.kernel.org, AJvYcCWo0N2VhsiM7BZGPS0wWpE19ascY65i0iY09T/3cGahr8snL900QPcfHaBioAW//vz/MY91AEk20xknMDFIACvR8hI=@vger.kernel.org, AJvYcCWvzDonkXiPmi5Cfs5ksBCboS7zx+2BtM6v84r8A73Y+Xi7g34UdvO2wJOS1YFmbEODmuE91WDh@vger.kernel.org, AJvYcCXBml4e9IxW+NNcCm+kDp+tNcgO/0lAlAHUqeVrtSRZiUuFibigExlLVbblPSZB181LFUrSSPQQvP5tp9YhUb0XqTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2rTqv4tkhtDSz/PlXLaS7k2owzpelWNab4DMBpcAbY2ILVJBy
	0FXsAVLL11ugvZelvbixsbZ92kTALACDE1Ox2SsXZ5BoV9RKjh8g
X-Google-Smtp-Source: AGHT+IExQsmvqvt3qJ2z23c4A8JPao3dfuvfjXBOOS7R6FV1JbeEQZGZJ7CVa0sXymsiLT2oFXxoUQ==
X-Received: by 2002:a05:600c:a186:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-432e4d9eb6fmr51016455e9.7.1731869099218;
        Sun, 17 Nov 2024 10:44:59 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab806e1sm130493185e9.20.2024.11.17.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 10:44:57 -0800 (PST)
Message-ID: <7b13e516f5c57a272175b23fe5f7da28a91a4d11.camel@gmail.com>
Subject: Re: [PATCH 4/5] scsi: ufs: pltfrm: Drop PM runtime reference count
 after ufshcd_remove()
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
Date: Sun, 17 Nov 2024 19:44:55 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-4-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-4-45ad8b62f02e@linaro.org>
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


