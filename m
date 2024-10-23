Return-Path: <linux-renesas-soc+bounces-10008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB3D9AD34C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 19:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 887CF1F2178A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 17:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0756E1CEAD8;
	Wed, 23 Oct 2024 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WOq7+AQm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F69149E09
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Oct 2024 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705877; cv=none; b=TCR/3RzJ7YGoOc+3InI5lxhoRKjZw78178ATxczK4RPHnpYlhDaz+7WmkB6HKnmbNzGlRgFtWL8tJnOTgN5vz1W2QB2EAuNnrSLYplvyxhlszeclvSeprnvNsfWgp3kPvFvKod7DgqfvQtfyKtzEZ/uoi/PLT7P+6NirztXDEgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705877; c=relaxed/simple;
	bh=HhCRM8LXsD648EezB/Ag71ruZTVUBPWIrjPd9FGl4yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJlTF7SwGLGG16WU36qlcEJv3HpKDrS2znpqt3RQOdSV+ARTVHoEoWEKHVXCfV1NmU3KyzDTZBEO41FbRaiwTVg9Mi18TMkeoLSWuHbCDn+iXJlS2xOzfbl59p/Vj/thc0g0V21WR/BYY3pBAqoG8YnwvBtrKK/9Vnu3IfM5kLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WOq7+AQm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso28111e87.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Oct 2024 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729705874; x=1730310674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=WOq7+AQmzqy5HguKfa82CgdhaSkJ4u1uXhBS97O1ypUAkRANtJcmyukIGPoPD96HXL
         zaRU98DSmJ04cmp6QD7X2HHme3D2IG9p20u6CxfaqSXMqYPR4BabkwQbOvZRBkuPZLmK
         3TXZuICsyumgECYWMg4B3q8n/PK8ah8pADWOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705874; x=1730310674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=oLJcjI4+ZsKIxDr4P9fUbHxF0u+zXpbAoc7cYt5j97V6qfaoelSH5WMziEDsbnUcPg
         5W6PXFou/7dDpb64i8OdcYxolhR/8lBSuSy8ku3XgYFzT3ROtmV1GT32ZZttuyjz6s/v
         +q4NzosFNaqiSD+goaUkaummEYhLZA0TfR0gtmpOdvGhpc0YBXonJTBSO4CqPzvNruPz
         I5e/vzBNtnz0/3WpclhDEuuaPpXo+AE3jVmAXOxlNm8/sYU38G+cgMRMGw6mhhNaOnTf
         Fs0OK/K32hQE2kJz/PJhAJauKxNF3jwFyFszviOXSJ8cEIN/SZpLKoVhDRMhrVbOOs90
         6Tfg==
X-Forwarded-Encrypted: i=1; AJvYcCWtf+nNg447LB0kfooXcziPSNtXw71cMBepSlNdruvI7TZnuXJnwANGIjfP2fmzL2c5qsw7AeoJ8lP2r7AHKPa9Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHf0W78lNdBG48DYbyFjpW8JSRJCJ7OMtJqmGf5rw2YB+SaJdH
	8ZxjgQ/JnDZedCu/TMpqqdslpleJsy3GGzo1QENW9Yof5NF3xNRuwS4dReyAchsFHEmwYA+Up6N
	N6htMrA==
X-Google-Smtp-Source: AGHT+IHSDBQ+qWguL261y8RpiQHsEGL1hmmaXfsrGlU9Ai2vZq/d9/LUGlAnNz9ii+NlX+LxIPLI5Q==
X-Received: by 2002:a05:6512:b06:b0:539:e513:1f66 with SMTP id 2adb3069b0e04-53b1a36aa5emr2035220e87.37.1729705874000;
        Wed, 23 Oct 2024 10:51:14 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2243157fsm1117332e87.196.2024.10.23.10.51.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 10:51:12 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so33781fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Oct 2024 10:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+n/MSwGvHD9PSFwHBONbwmZDzLtNTNFhM60bTqR4od6G62XgOG5gRdgWGfrsLb/Yewl4aDQ3b8aYAUh8xZc5x6A==@vger.kernel.org
X-Received: by 2002:a17:907:94c3:b0:a9a:8042:bbb8 with SMTP id
 a640c23a62f3a-a9abf94d4b2mr369489566b.47.1729705563762; Wed, 23 Oct 2024
 10:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
In-Reply-To: <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 10:45:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Tor Vic <torvic9@mailbox.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, gregkh@linuxfoundation.org, 
	wangyuli@uniontech.com, aospan@netup.ru, conor.dooley@microchip.com, 
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru, 
	fancer.lancer@gmail.com, geert@linux-m68k.org, hoan@os.amperecomputing.com, 
	ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, 
	manivannan.sadhasivam@linaro.org, mattst88@gmail.com, netdev@vger.kernel.org, 
	nikita@trvn.ru, ntb@lists.linux.dev, patches@lists.linux.dev, 
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru, 
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

Ok, lots of Russian trolls out and about.

It's entirely clear why the change was done, it's not getting
reverted, and using multiple random anonymous accounts to try to
"grass root" it by Russian troll factories isn't going to change
anything.

And FYI for the actual innocent bystanders who aren't troll farm
accounts - the "various compliance requirements" are not just a US
thing.

If you haven't heard of Russian sanctions yet, you should try to read
the news some day.  And by "news", I don't mean Russian
state-sponsored spam.

As to sending me a revert patch - please use whatever mush you call
brains. I'm Finnish. Did you think I'd be *supporting* Russian
aggression? Apparently it's not just lack of real news, it's lack of
history knowledge too.

                      Linus

