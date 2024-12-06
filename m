Return-Path: <linux-renesas-soc+bounces-11029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F479E77F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 19:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C818B1883417
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 18:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1C91F3D46;
	Fri,  6 Dec 2024 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="ihp5NaUt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF31195FF0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733509028; cv=none; b=AcxmkFYRE08mio75/zLADVXQgOJfvMJQ7xWypvoweUKYH3ueTwwb6fAanMm3R9JLXdC8A3II2HKIB+yIjIkmGnIvkQFFd+50m5u40yjF7k49HWaSTFEo5Cms4WMqXfQ7q3hOT7jOC+muHv1TSFjJvqOMV2/qR94timt5ILXCiYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733509028; c=relaxed/simple;
	bh=0kmwuOz7qibXuGzXJBalsi9zlGLF7Gq28kA45wgqC4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSw78eCfq7O1Zt8jTrqa0I5wVROFkxW7y9vZAL2Drq8A1D8qEsQCb53N2QPaTK1F2tYs/12+FnD+9SinH/TIEWCIO3CpyNAtJgfylmST0z/u2orx6UIO+sQ7z+v+PzpMRHRuYoowKArjmYFb40KkE41TX4wJr8uQSJhRCMMYLNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=ihp5NaUt; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30033e07ef3so7595081fa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 10:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733509025; x=1734113825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6ecbloalYthckNBNhPOKdoCIqqonfcHxmM2rm8Txtw=;
        b=ihp5NaUtowz+r+K4K4TJxGidG3B0l0vYq75fCy5U0qaDlpayB1vrPqEqGMyD8XKl8E
         zwRmIZ3aG/A4n8lXj55V0S0SMq2gHI5ZfkE72HLvIMxatAPL/Vbl1x3SD415DyUbJVb7
         Mdfcj8C5Rn3+NJWFaHaoSbt8otVWeM9fomtOwVMxVUqidmcfWrEmMp5JajX+7U9iyeh7
         adN8tNA3E+POvtvT1Nh5VfVXgGF9HOFOKbaUOO0d9xtO6poWd8u81wawD1+yB7jZcjxK
         5nQrm3o+0Ps5cu7fqX1tGIGWU9+H7ZzWBljib5h5IVUYcjCv/cCjg4QxTFJp1+DEC5ft
         dWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733509025; x=1734113825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6ecbloalYthckNBNhPOKdoCIqqonfcHxmM2rm8Txtw=;
        b=ClbBfxXKMfcx1Ic8z4AmeGO/CkSgC+vR32T5BzUl3mISVvyfKURmVQ7Iowis2cuYKh
         OgyPN1rrLKaaiDAhI9RIdVwPQN1CCapdzC+vlaQaqH0Y5yTc25BZt4yUcOc7MqPHWPkf
         vVVY+g8gSyfhCqjeXlGxwlTfHI35YAty/SLaloOpwvfT+pIRpnoUB6eEJBv5uvgXWNiw
         15gAKUKJmbkA5CA/7bYtzlQpSPxQILz8/bOjNiWX3LNyMhGfjvFpPb9kUuKZxlGRwGOC
         npo5MeCmiGvOmhPX2Pr8/ZY+2vBnredoKLScBbVfotIsYSMC3nHanSzzm/ilZLHKxw59
         RP5A==
X-Forwarded-Encrypted: i=1; AJvYcCXAMLkiik14a/D227r5Kg2IoiojcAdBdvJYLLGN4R7AgYtGmGlyw0l5epB9bbnO0AQcLIgtoAVBUwr7gJWcVOMSQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU/5X+scwwgOfLCRQWsAj+8FaZCwqxOrOaySB4OP6UaVo/sThV
	M/oWuArJ6MLOMlAs2HIUp8IyLxu7XIsIWRwXgx1tZC8wGL10dcVYHlypnZkFP+o=
X-Gm-Gg: ASbGncta7WnPDFICFB5jXVztSIPdY7jX/pjTlGDGz/wRDGVXPHFqoRbD4ZLIODxsC6P
	LEsAEWrCHzt1+dUWqRuhggX1UkoYXZs69oDAzigAh+1wMaxhLVZOwxhFC8bfL4/Ws3pk86WT5hB
	gyQ/+5u3KkfxljNYWQMHXx9tl3ltCYSenu5cW8QgR57paWh6d0K2L4HmBDTRE6BzFGslUDqiwe5
	S9tHFpzI909soMPMp8U/+MFC9aXx2vrj8tGjfIL35js/pUvk7BYJ8qVNmmZKDUwurtzwA==
X-Google-Smtp-Source: AGHT+IFSQk4LVXdGCOIZgkcmUG+e+P3Squ0CFAeeVN2glBcgom7D7Xbv7QXnrDJUIxPedfYrmXMMhQ==
X-Received: by 2002:a05:651c:2119:b0:2ff:db26:2664 with SMTP id 38308e7fff4ca-3002de40268mr13998711fa.6.1733509025014;
        Fri, 06 Dec 2024 10:17:05 -0800 (PST)
Received: from [192.168.0.104] ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020d85076sm5301271fa.23.2024.12.06.10.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 10:17:04 -0800 (PST)
Message-ID: <3796604a-0636-41ac-b7e2-13ccd0694d4d@cogentembedded.com>
Date: Fri, 6 Dec 2024 23:17:01 +0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] net: renesas: rswitch: fix leaked pointer on error
 path
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
 <20241202134904.3882317-3-nikita.yoush@cogentembedded.com>
 <20241204194019.43737f84@kernel.org>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20241204194019.43737f84@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Why not move the assignment down, then? After we have successfully
> mapped all entries?

Just realized that moving assignment below the loop will open a race window. DT field is set inside the 
loop, and once it is set, completion interrupt becomes theoretically possible.

Furthermore, realized that existing code already has a race. Interrupt can happen after DT wield was 
updated but before cur is updated. Then, with the completion code won't check the entry (up to a new 
interrupt, that can theoretically not happen).

Will fix in the updated patches.

Nikita

