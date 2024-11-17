Return-Path: <linux-renesas-soc+bounces-10556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F89D04D9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 18:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0DD51F21ED4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 17:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FFD17C200;
	Sun, 17 Nov 2024 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLD67UOQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7DE15C0;
	Sun, 17 Nov 2024 17:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731865066; cv=none; b=h2oewcGgZo2O/mYdmCZD91YgaVV8eu+SGfZYV3DHY7x4uoWmRMS2PtEROTW0wcPbw8chQMERQFCVRn/SyiU1BmIKyanT5WatB/z2cMFlu1oD1/LU421b0OqQ0TlOFAwV29zatvz0pARdo2ruaJIGfXn887n09DHE32yofhlnQJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731865066; c=relaxed/simple;
	bh=1L0XnKz/Bgs59CaVEtu2B7ERAAzylQiFjbdPs2G3uUA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lmM3gNKCbOnV/2pc177UT4FsVhFQKMC99Ld09l64WGk46QPybl4jxmEiJ5jwWzlKkoFZhsRTneyyOBZqzUDbRPxnNToFPEqmO6zr85EVzbTtYEus12/SdaoKlCcJi9BOTTgQTC8WhTTWA2h/QljopnOa5O2yR/t5oJ5Kml89gdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLD67UOQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3822ba3cdbcso1332333f8f.0;
        Sun, 17 Nov 2024 09:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731865063; x=1732469863; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1L0XnKz/Bgs59CaVEtu2B7ERAAzylQiFjbdPs2G3uUA=;
        b=HLD67UOQPgx2zAjS5tMI4m9TAifnFXrzNFlmqBf10BgtsDjaFmg6+up6J2Z6PUJ+69
         LSyXk3FT/S05eYtVZR5E84NaELh/96TKb47Pkf64JBQUVARcMT6ui3meI3Jq8uFpRwjz
         4TsFuSvfrlH0/CxyRN5qgk7SkjlCFFdcLv23Sj31MNtTRGv4rL/iJi2hHY+khaWfSjtc
         6MRjDR8idgFv5eEsKulnBV5aJ0sJ+S29yBMT664emGvOKRrtO4dZFiMmLCQnu659GyQu
         VFq2dDsv+hIYkBl1Xyw/jd2oc3+unsbIwwsibU0FIz1DQM8umOUMN156PQ6WqxSSwie6
         Icqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731865063; x=1732469863;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1L0XnKz/Bgs59CaVEtu2B7ERAAzylQiFjbdPs2G3uUA=;
        b=dwGdGPJZwm25YNE8QtgEk2aGiDQSADx97s0OyDsOQLOnqqAnd4gKviCjOaVmrJwfsf
         Ta/WLIgRxFh3eYvrk5Eq+kXhMcN89Fihi648G82a6tATKKzRhzEjqAJbXUrVK8fdU/SZ
         l/K4ri/D1WaDThPEXYAiBBpc5G4SWqRWyHObKtpmV/HWLSwoQ5PC3PYjVLfTjttvNM5I
         K9K57g9fEXpja/sgf8KDg/CHaB4s+jdqJFTVomGq/w6/FiC3um1D+Z9n8pQDdkO/LnPZ
         opRA83+XKMqlO6fC6QZaDeQ5X8lGcZ3KMOxKCDqrS9525OjuVFs+ZoV/oPEcYLgAeUqK
         T+9g==
X-Forwarded-Encrypted: i=1; AJvYcCV1AJ174LomjRjgFjIypGDyi6ou0P57mkpXhacEIJn0yMHaNDo6N/qAQxc18JemfRHTTnnWAfFp@vger.kernel.org, AJvYcCVvKGnBpQe3TU+oH3A5JrvqdU1MFWAjTSb4HAWqaRg1Ibupdldtjv1VTy+HAmwBf7+8ujaVE1TSYD6CsnAcEhJ82Bs=@vger.kernel.org, AJvYcCW3UePuEdNa3ts0Y5YM/9cJ0nVMSKFMKKQi7im/bEQ1mHLMyfudK32Q9k6gE4i46NbhM34erVnXOtGPvqYF@vger.kernel.org, AJvYcCWw+d6yNv5ubeFBKe3rP7Dv2nqwJ9u7P6tM6gqoVFpvgyThCO1BZex8ygMDWQyBu+N3HgnLxKnhDYamuAeGOnunD6g=@vger.kernel.org, AJvYcCX6tfS0ARVk+F5o+9ysNh/A88uIc+kYFH7gzF5j6iYB+RDKqxmIPDUaT6KhdMlqK15dhxAQjIE3vywF7GmE@vger.kernel.org
X-Gm-Message-State: AOJu0YxA5PWTbPhk2LsuP4deMThuja0TfOx8J5s+UKj6C1Pg9zSEqR2A
	VmQb0SdEhcvStllHVv8DpWDl7L9zsvVNFfHZL6TcYXBlivICk1xk
X-Google-Smtp-Source: AGHT+IE/XAQXxkHFy6KvWJLP0RKL+rq45e6J5Y+YNFyBIw8NtuYv2A6BeGdBO5NUD9ysHPfwh/qb3g==
X-Received: by 2002:a5d:598c:0:b0:382:22d7:b87 with SMTP id ffacd0b85a97d-38225aafdbdmr6163594f8f.58.1731865062450;
        Sun, 17 Nov 2024 09:37:42 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382417f33b8sm2435994f8f.45.2024.11.17.09.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 09:37:41 -0800 (PST)
Message-ID: <3bc8ab6266c7a1c54bbc0d6eca53019734029cbb.camel@gmail.com>
Subject: Re: [PATCH 2/5] scsi: ufs: qcom: Only free platform MSIs when ESI
 is enabled
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
Date: Sun, 17 Nov 2024 18:37:40 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-2-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-2-45ad8b62f02e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-11-11 at 23:18 +0530, Manivannan Sadhasivam via B4 Relay
wrote:
> Otherwise, it will result in a NULL pointer dereference as below:
>=20
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000008
> Call trace:
> =C2=A0mutex_lock+0xc/0x54
> =C2=A0platform_device_msi_free_irqs_all+0x14/0x20
> =C2=A0ufs_qcom_remove+0x34/0x48 [ufs_qcom]
> =C2=A0platform_remove+0x28/0x44
> =C2=A0device_remove+0x4c/0x80
> =C2=A0device_release_driver_internal+0xd8/0x178
> =C2=A0driver_detach+0x50/0x9c
> =C2=A0bus_remove_driver+0x6c/0xbc
> =C2=A0driver_unregister+0x30/0x60
> =C2=A0platform_driver_unregister+0x14/0x20
> =C2=A0ufs_qcom_pltform_exit+0x18/0xb94 [ufs_qcom]
> =C2=A0__arm64_sys_delete_module+0x180/0x260
> =C2=A0invoke_syscall+0x44/0x100
> =C2=A0el0_svc_common.constprop.0+0xc0/0xe0
> =C2=A0do_el0_svc+0x1c/0x28
> =C2=A0el0_svc+0x34/0xdc
> =C2=A0el0t_64_sync_handler+0xc0/0xc4
> =C2=A0el0t_64_sync+0x190/0x194
>=20
> Cc: stable@vger.kernel.org=C2=A0# 6.3
> Fixes: 519b6274a777 ("scsi: ufs: qcom: Add MCQ ESI config vendor
> specific ops")
> Signed-off-by: Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org>

Reviewed-by: Bean Huo <beanhuo@micron.com>

