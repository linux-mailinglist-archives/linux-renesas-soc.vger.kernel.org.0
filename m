Return-Path: <linux-renesas-soc+bounces-9803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8309A118F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 20:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A8A828673E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 18:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DDC212F14;
	Wed, 16 Oct 2024 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSife03Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5441B290F;
	Wed, 16 Oct 2024 18:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729103342; cv=none; b=aUTM1FIZnpvUtmuWWPrHLursxzHkMBBqzemIUHwcrYkhGMN3ZBWXnIC5spg0V/6tYrZnoKHZmzsseE97RYp5NPFETjffhAK4OYxPfwqBSo1eLXdB6OPHje+zo1hvNKokhBuZ5TdUQ/UbEhCarZXgPVN/Weo/lcCJ2q5m7pjjoW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729103342; c=relaxed/simple;
	bh=wT76ZREbVhLgdhwYV5Ta40j5tUwtnoktB2lVGI6sunc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IU3psT+uNTMliul8mVFZ9560VQAhxpLvA38AeOnnz1QWeMyLzXq8mtv43jl4nXn/p3mFdnS9qGsh/IC8k1ZoC40fo0nFqCxhK+qKPoRssfCeaaj32fElMj+QNnMXOSOIa1reifEZTGm9J/8sWYFhYvKHDSvO0mxexoKeOOD+bl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSife03Z; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e29756dc019so78028276.3;
        Wed, 16 Oct 2024 11:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729103340; x=1729708140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21SqynB+ScB8hvflEvo8tHa/c4pVsZtnxN7DQ2/6UEY=;
        b=kSife03ZCXdi2NDlp4m9hEoiU2Kdzia9nIPWDfP5UcV0NdzAgNL0S/+i6fZMlSofEP
         hbzfaFjBDFmF3yVhmNZJ25PQi/RJ7P4e8/SRJ7TvfV4FkzNTAkY73GuZVuyn5EJLbhUE
         xBcuJILAZOY4iK2TKlVw9VvkuapxNfSmFW5x/gjObTCIXJ1Uls3dKuFlOAYZUxDPhML/
         dj9sQMSequvq5eY/K28Un+wg9wjR5EEhSB+ffMktq+W2mh1edYIFh2FMpZF+lKk0rCo6
         MeIq7cGu7Ks9P6Eu18zgUFNsgY1LiHuSeIrCZC+vxVeoQ08D/IEnIwfbqYxayLzohMD5
         jQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729103340; x=1729708140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21SqynB+ScB8hvflEvo8tHa/c4pVsZtnxN7DQ2/6UEY=;
        b=KFC97mWrTg/6VGWZPVyBIpQmaYaeW42/TJ1Eapfaz37e2AYalSfVtwlP9yROVZ4jbV
         M7g7BvT+hy0hedAVGykHWbJLB7Q5aUvOW2MKVMJmkOUldG+DKd2eHjzlNblRXKhYdlOk
         jlVNtQnRBtM5AkEvreZjsTfSEYjJHeDUTGu0/v8nP/krckngDWfbjoeigJacJKeYW43d
         /JCdTQ9mowAK2O/oBTcUSgqZ8YoEIFRWLNaQwMtvkTJEpEH+Zd//tzRM+WPCMoFSIlrV
         Sqtsmqnb2VzBTNVGv2zTvSxG9oVRBjrnDReCii26givtAPwvxcYgo9V0tLkdbRkbHTfm
         R9lA==
X-Forwarded-Encrypted: i=1; AJvYcCW9XihPpo9YdDzz1o6DBdYK+3jQ3MdFGL/l9rVzJBWvM+zFTBM1b8SZo64K++k+uMzzYaV3uaoE6Hq8T7WoyyXrs/A=@vger.kernel.org, AJvYcCXDYxlbM47vKWCKfe3B+gsiOo4YD1B57yzIKUdvKM4UxIbF8ZZmCymhvziqdPJZ8c3p1+xmvNvdXdlqUyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEjsNPWNbC2hvs8ZVnFPzAs2J9H1P2Q29NpWkFy/U53O+bfvEn
	jI56Yc1Dkh6RueayoZY3KwUnhFCnXo9PoieGVEjg7XHwiGYojXJP6uGcMwcNHyAuX7oQrzJ1539
	rPAredr3bRaiihz7elvMmbWdI1nbPUfY6
X-Google-Smtp-Source: AGHT+IEU3ihP93aNIqC4+yXcAUYTtJPME6PzwYuFlGtu8wik9S7SxgeyZOjY2Ju0o69ojWl4w55/OMGl/2JjhUIHu/c=
X-Received: by 2002:a05:690c:dc6:b0:6e3:dbbe:2736 with SMTP id
 00721157ae682-6e3dbbe2ec7mr38528907b3.32.1729103340172; Wed, 16 Oct 2024
 11:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015200222.12452-1-rosenp@gmail.com>
In-Reply-To: <20241015200222.12452-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Oct 2024 11:28:49 -0700
Message-ID: <CAKxU2N_vK8WROUYdSRHnh_Y5tyW9dX+kk1BCTk-zU=pFH7HTwg@mail.gmail.com>
Subject: Re: [PATCHv7 net-next 0/6] ibm: emac: more cleanups
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Woojung Huh <woojung.huh@microchip.com>, 
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	George McCollister <george.mccollister@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Breno Leitao <leitao@debian.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 1:02=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Tested on Cisco MX60W.
>
> v2: fixed build errors. Also added extra commits to clean the driver up
> further.
> v3: Added tested message. Removed bad alloc_netdev_dummy commit.
> v4: removed modules changes from patchset. Added fix for if MAC not
> found.
> v5: added of_find_matching_node commit.
> v6: resend after net-next merge.
> v7: removed of_find_matching_node commit. Adjusted mutex_init patch.
>
> Rosen Penev (6):
>   net: ibm: emac: use netif_receive_skb_list
>   net: ibm: emac: remove custom init/exit functions
>   net: ibm: emac: use devm_platform_ioremap_resource
>   net: ibm: emac: use platform_get_irq
>   net: ibm: emac: use devm for mutex_init
>   net: ibm: emac: generate random MAC if not found
why is this set to changes requested?
>
>  drivers/net/ethernet/ibm/emac/core.c  | 81 ++++++++-------------------
>  drivers/net/ethernet/ibm/emac/mal.c   | 10 +---
>  drivers/net/ethernet/ibm/emac/mal.h   |  4 --
>  drivers/net/ethernet/ibm/emac/rgmii.c | 10 +---
>  drivers/net/ethernet/ibm/emac/rgmii.h |  4 --
>  drivers/net/ethernet/ibm/emac/tah.c   | 10 +---
>  drivers/net/ethernet/ibm/emac/tah.h   |  4 --
>  drivers/net/ethernet/ibm/emac/zmii.c  | 10 +---
>  drivers/net/ethernet/ibm/emac/zmii.h  |  4 --
>  9 files changed, 27 insertions(+), 110 deletions(-)
>
> --
> 2.47.0
>

