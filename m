Return-Path: <linux-renesas-soc+bounces-10557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 826D09D04EC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 18:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145701F218D7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 17:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8580E1DA313;
	Sun, 17 Nov 2024 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6mF8prQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B92335B5;
	Sun, 17 Nov 2024 17:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731866382; cv=none; b=uc4pk8UeUYMG+vc46hFs2yGCX46DfiSFA7lJaZ4lphiOHCqsAwiMvdKEn6+IBsTK2OiN3WED6fZQ690U7ZSuPgdc1EEo8Fm68PkT7k2k6itCbSybRXQ8v8gP8jBXE7JTSg9PbSQB18Uxltl+bleSqllag0w3TVTcMsa5yTRDGrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731866382; c=relaxed/simple;
	bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RJnVQgzMNIqTTNVhaSjDv5ppffD/OfLpqdvJ9X/UKIImTPecnsHQ3I1MVminStIhHssDr+xOHNNlhNPTI7Iucn5MzDBrUmzPUegM/789L6Og9tNtJl+JiZKUBpnY175m8i/2+uvCQUW6DS72ndppwbVJU7z7NcJaa1c9ZoNvss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6mF8prQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38230ed9baeso1148642f8f.1;
        Sun, 17 Nov 2024 09:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731866379; x=1732471179; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=c6mF8prQVJxyhMtg7ExPwAc1LAs5scaC/zW4OqFFswv51UfefwxH4L5NnLenLwuR5N
         bMn/Bb/MHk8rmqH6nPsniualcfnlk0ZrHAPMXObrLszxmmhsqemuYTjcZ4o+pTmSRVnu
         9zTNleOFJ+vxwcCwrxgyhIJzSZ/QPIE5qEyx4xZEA90neta0X5VijNE2m5pZpf1elyTF
         Z/viGVS2TKuhJscy1pNKLGKS1WfocoCHvt96S9/5LSwKs4mprE2YlQcMHLq2heNYlAia
         Q4ELii9KGWMKbZuU8tExOxQc+obkIIYy7Ru1WXJ0DRPit38H5XYcuPkikP2aEVpQQRzT
         Xyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731866379; x=1732471179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=m04BeNMJauHT+F8Bs3O1erfRJvKJrpbA8DU5kd8o/WtmNXkJmcZ6zR0daEGxes8ZYh
         LIGdKSfy4lrc3nVOCicxAaN9WcXMgEhHvN9quxat4RsXpZkMAamv1Tb+nuyWSNL39Uc4
         ZrWf46uNtgXYhX54YdJn+RcAFua3kd1SHN4No+glGnNPcsWtLd8Jfrj8FfBbfUk3iipJ
         83v/EGY7N3affDUxp8gDfaHBna6/f2vGau3SLcXh9JfPHOPB64oyMIzFS68OkLEYYzTG
         yaXxj8H1OTEjuHZPDhFnV04U1s2tR86SNLL0RS8qLt/GHoUD1tjTiEgx0fbcd034SWn8
         1uxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbim2VE57h/hph03FEpEhzqZf+xP0veftl2fWTrve+9fn7IzE3r1x8BCmMP5vY584bIcpL8Dm5FjF1BSWUYOWxA6E=@vger.kernel.org, AJvYcCWzAC3j4fXeqmo4/tpifdj5TBNyvxW5OPQGtpnlS0TE31UqClGaOb4f8WtZ5NAJjLzlj1xTRclczxyq59Wb@vger.kernel.org, AJvYcCX/UmF95vXiGVL8nv6dZXK0dZ+5+M7TZtRHxXiFXl7xUMVV39V2UwYk+PcrCa3GpjhUlW2/HZUanbLOS+4LrO3zNk8=@vger.kernel.org, AJvYcCX3FudyzHT8hnZCWn31ZIpA3YarXl7pU4bJzvHWVrEVk/af2KB8HEfNG5cNOpf79gdI0KesxGI6@vger.kernel.org, AJvYcCXcVg+B2wSvAYGEJhqcl1U5ssUkjx4D0ZGEOAgj+Ia0mAz3blvlTk1PCaxQY8JbnZfJ9VgJvvI12ZfHsa8l@vger.kernel.org
X-Gm-Message-State: AOJu0YxEl2cUg7hs9mkYg7TjVQfCKl+u5OCICcyz06UeO9/Nzq2rQUff
	GfQYIofsltuvNPGWDdwqyuZz+daqiVmxy4S2I5G9QOAjFXBsExp6
X-Google-Smtp-Source: AGHT+IHqbrlLtaP5Yd3T+27nHAETyVBfr+n6kx9rmAYJRbEsnbFwXaqkEA83aORA115kLsYVwdaKWw==
X-Received: by 2002:a05:6000:2a7:b0:382:4485:2db2 with SMTP id ffacd0b85a97d-38244852eacmr1792870f8f.1.1731866377467;
        Sun, 17 Nov 2024 09:59:37 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3823e0c910asm3389235f8f.39.2024.11.17.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 09:59:37 -0800 (PST)
Message-ID: <e96fe03c6515e65f91c2524181ffc48815c2831f.camel@gmail.com>
Subject: Re: [PATCH 3/5] scsi: ufs: pltfrm: Disable runtime PM during
 removal of glue drivers
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
Date: Sun, 17 Nov 2024 18:59:33 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-3-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-3-45ad8b62f02e@linaro.org>
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

