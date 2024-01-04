Return-Path: <linux-renesas-soc+bounces-1294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC4B824760
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 18:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0897A1F2567C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 17:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02ED2C68D;
	Thu,  4 Jan 2024 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr0VYVyf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4312C841;
	Thu,  4 Jan 2024 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59618e40717so326771eaf.2;
        Thu, 04 Jan 2024 09:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704388882; x=1704993682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8BI5SjNwqkh3S32CM/if70yfM5kVQSoN9Wnx0VvzVtw=;
        b=Hr0VYVyf2fPf2aqTYoZ6C2quoT6fxiirRIUmE0vAHxKtOLNwUgTtM1tHMQzC5HjCTU
         kybomCPXD3BMy6TI3yphGm9ytXdub5wOxxbBNF1bgnYsCNkMDnrGzvsroM20KvUSBkC1
         niOaOGSOckm8kRSdYd3FKSK9h5cQQxwe/2k2e2wpVRxsE/E5CcptQAzYnReVnNX1dodI
         ofQhzHdxz2O8lp/Frw9uYTyweXrqi33y7C9N2zOuH4Bp6V5fjvshFF93aPwOeprZY3Ef
         efNGCfw7SWRt4ysG4E4gN6s2+6U+U8cV/53lPEvzTpokgOE8RTg8ylxJpuigoUn0coYK
         enzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704388882; x=1704993682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8BI5SjNwqkh3S32CM/if70yfM5kVQSoN9Wnx0VvzVtw=;
        b=FgqKvnLYbybggqPHf67+M7E7HfxI06bufxa3dHNOYyEfo7PPuL2D7sGzh7XPkbOTaV
         EgedzAuL3xJOse2ccJo9Y9lybsNZy8yWgryyZaLXsXcy+whEZtmhOTz2q9JHvH3zR+T7
         5H6fv6X3jVKlEM7rtpJcJeUe5o/IpJ+In68/wv12Jp0q6MWNmYqrrz9u4I2RHX8R0wN8
         2tjlPt/SPnZVfRqD4D2u61qgvEyYaxWrip4aF5ZKOCLud/m/CW+uxDlqwg39OOhynwxx
         brJdhyKtKErjfHgTt0GkW9NkIZMDfOyB4M+WptieXwavpCCBlUgQz8iM60hH2cZ6PHHv
         zLHg==
X-Gm-Message-State: AOJu0Yxu/PFCd67h+9fTYUGNIjtPc2dY/aWwejLBk+R1OoeWV4o2zWkp
	/QCdNb5Kr0X0VCUNL4mc10U=
X-Google-Smtp-Source: AGHT+IFC7D5oNUCjmCa04GpXW6a45MRfPmA1wmmEL/GJJooUGqySzfUydAg0L9gU5jYNDrP+f1O0SQ==
X-Received: by 2002:a05:6358:3423:b0:175:64c5:bfde with SMTP id h35-20020a056358342300b0017564c5bfdemr789304rwd.6.1704388882546;
        Thu, 04 Jan 2024 09:21:22 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id fw11-20020a05622a4a8b00b00419801b1094sm8663942qtb.13.2024.01.04.09.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 09:21:21 -0800 (PST)
Message-ID: <310f0f2e-860f-4bda-8f2b-de0ede7b8133@gmail.com>
Date: Thu, 4 Jan 2024 09:21:17 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew@lunn.ch, olteanv@gmail.com, hauke@hauke-m.de, kurt@linutronix.de,
 woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
 arinc.unal@arinc9.com, daniel@makrotopia.org, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, claudiu.manoil@nxp.com,
 alexandre.belloni@bootlin.com, clement.leger@bootlin.com,
 george.mccollister@gmail.com, linux-renesas-soc@vger.kernel.org
References: <20240104143759.1318137-1-kuba@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240104143759.1318137-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/24 06:37, Jakub Kicinski wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to all the DSA tag modules.
> 
> The descriptions are copy/pasted Kconfig names, with s/^Tag/DSA tag/.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


