Return-Path: <linux-renesas-soc+bounces-11248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D19EE0DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 09:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0F70280D4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 08:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A57520B805;
	Thu, 12 Dec 2024 08:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eRKccMB9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736120C009
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733990902; cv=none; b=IKmQLxfgMV+tVjIx5J4NbyH7Qkv24wYpG/JsCGAVFoFS9dXRqijsILIfeat+dSs60FrZzvzbAEw0DvCyONcPg3lkArq3u9M8uVK6vj6PkuFkKFnUVR5Wnq40s7Ak02IlehZJi1uHqiko8n5V2yv6IfdzaRRdZzj1HcIK6OQZ8LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733990902; c=relaxed/simple;
	bh=4zY98UHHGfgFUFQXkyrd6VkTOS0moSnEAon1VWvcJWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHexBx+zkMm61vtW+T4KW3FhLZLp8UXstakGZLZLxM5WQjDmyvaOlIQyd/4uFoF2Tk0avTj9lv40VT1r91RkBL/J/Jk0j+Fn0m9AcficsOQuczGy2hR/jij+utILjd5DhcCD1XaSfUJwhUU2Xq8GgBLRaC9+6qI1VuNRb4mq/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eRKccMB9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733990899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bjf1nmOaVLrku/wXD9lDjECZxn/Olb8fTnRITGTTN/E=;
	b=eRKccMB9S/K/gLAn/D4QJP+UX3uFs2y71HpcCjFpzFEI/21EEpjNeBlbfrBxR956U25OZY
	7KYm0CNYHglB5E1BHmjSfL5JmVi6908tt//juAIsmwhGzI+kt6t9t5mYrrWoBfTkidjjK2
	Pp/S1vrEc8sfmdjAgfo8vlL0r+BXu2Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-g9FgO_X3NHWl03dGqb-ddw-1; Thu, 12 Dec 2024 03:08:17 -0500
X-MC-Unique: g9FgO_X3NHWl03dGqb-ddw-1
X-Mimecast-MFC-AGG-ID: g9FgO_X3NHWl03dGqb-ddw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385d6ee042eso204392f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 00:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733990896; x=1734595696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bjf1nmOaVLrku/wXD9lDjECZxn/Olb8fTnRITGTTN/E=;
        b=DVqZKgaLquW8q/ZuhsqFJDFPZBE/rzNI04VC4URWYMCkhqmmQl0n2d7fT0Q77+6DK5
         xkak9uPF5CtD/qDpWfEp9kZ2SOvN8gFqmqH7kaD0D/NxwuvakV/GhoyZXAzcnEvhXsAF
         T59L69xg6cWKeP+QZMY38Sh5FEcwjEXYyaQ291xbXtN7yglEdl8S804HuOTOKiXtPmxi
         lpJVaT9/3pyScql0S8xmyQMLB2rFfSa9qBU5+Vqgj+xJ1qpNRQ76CkluBnmSSk7zBakZ
         KKRZ8w6RMGJ6YAhjm3UbxcfFPeb8g9iQYVQI+1K59a1UC18+WPyLR7wxUPQah1ir7yTa
         fLOA==
X-Forwarded-Encrypted: i=1; AJvYcCWwH1vhbpIQ1lAPCJKMu4gh/Hs04eZpdvZYgKHLj1qpEMKMy+IOxyYuMpLCl9yxjP2SffgCyyIV/q4UuaC+I5h4vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJC5APuYJoPWgmG79EklDiH0oIskHiWAqRwtrp1dMUzgpp/R/
	09ND6XUP/8qQBXofr4mZqbHAIowHri/Hg8UDmoDHN+oaW0pd2CT6RZflFDr5LGd/nKNAv1Q0Cm2
	zmyF5Lh3K6rdFRrqaRbgGdZFj3+oGgIYAQp8wu1kTnZYiIPYE70sw5cLWBcoQIHteAiE1cbjO4d
	PMrWE=
X-Gm-Gg: ASbGncuDVkwRJ+UjBHh0aZkIHXejsIOnSHKba12rKttYbbLwlxJGzsJm1AWCKqS6+Ci
	bEVRXAAEGucLnTZuki4OEJz+E1h0GSx2la+sBGe/HLwqIY7x3sYDfL2FfPd+LP6hXSerQ9+7IJV
	XW9u+R9QhMa7A3l4qBT15d1rK4mgdf6nno6H/koIIMYucY1JJOCq3NM9YNoed9UcbGDM51OguFm
	xLo52+74P54bUsEPJIIegdwZgifFbHW2sRRSh6qfACbMkLUvOgD6sUZsQ0TSIWz3hVaLzLQpa0l
	yr4VGU8=
X-Received: by 2002:adf:e18e:0:b0:386:4571:9a22 with SMTP id ffacd0b85a97d-38787695702mr1905602f8f.31.1733990896399;
        Thu, 12 Dec 2024 00:08:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTBQqIZP4mAbmNDkq+BdMt3lJ9rORZUl6zp6FVSlb2GdXN4hAbWa7GzDXPUGiEy3/sL0XluQ==
X-Received: by 2002:adf:e18e:0:b0:386:4571:9a22 with SMTP id ffacd0b85a97d-38787695702mr1905577f8f.31.1733990896075;
        Thu, 12 Dec 2024 00:08:16 -0800 (PST)
Received: from [192.168.88.24] (146-241-48-67.dyn.eolo.it. [146.241.48.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878251dcdesm3227619f8f.104.2024.12.12.00.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 00:08:15 -0800 (PST)
Message-ID: <ee865add-5f30-4c7d-b14d-fbc693dba265@redhat.com>
Date: Thu, 12 Dec 2024 09:08:13 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/4] mdio support updates
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/8/24 16:52, Nikita Yushchenko wrote:
> This series cleans up rswitch mdio support, and adds C22 operations.
> 
> Nikita Yushchenko (4):
>   net: renesas: rswitch: do not write to MPSM register at init time
>   net: renesas: rswitch: align mdio C45 operations with datasheet
>   net: renesas: rswitch: use generic MPSM operation for mdio C45
>   net: renesas: rswitch: add mdio C22 support
> 
>  drivers/net/ethernet/renesas/rswitch.c | 79 ++++++++++++++++----------
>  drivers/net/ethernet/renesas/rswitch.h | 17 ++++--
>  2 files changed, 60 insertions(+), 36 deletions(-)

@Yoshihiro, could you please have a look here?

Thanks,

Paolo


