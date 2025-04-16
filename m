Return-Path: <linux-renesas-soc+bounces-16069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6EBA90473
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 15:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090AD17C2D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 13:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA7418A6AE;
	Wed, 16 Apr 2025 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n7zgxNZe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75BA179A7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Apr 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810651; cv=none; b=t4Td7PmrvCI3cFHQptADxMMXNbkuTiVMxjNr3aI54vbZ8iu+MVUGUhfiQ3Cr8pSrOlROSK6wrPtFw79EZhEUAePFSz7oC1YnUmWxFK4coqy+UHHxldgBgShq4hRe+RCgDkwwpGSCWnZrdkZRDu+NX/20ofrb4nrX2JlMm87HYbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810651; c=relaxed/simple;
	bh=IqXVdgOTxAmZCclRTSrS8zJLAvwY1CCH+k3kfD+sbyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMEcZ32hcgLBvfBUCgB4UQlcHkxTStDohYEhJAF87OXf8fI3CZJXD1BFSUfj7slvNjIbEeghcVGTC9xp29yn98u4ro+0TKQwPOwGaW+eMngvFh9usrfojOeSqlBiqCEqKQhe49kxsg8T/hdoLy4U5yIgyEwH7nNrtCu7qPWXJpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n7zgxNZe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5447965;
	Wed, 16 Apr 2025 15:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744810519;
	bh=IqXVdgOTxAmZCclRTSrS8zJLAvwY1CCH+k3kfD+sbyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n7zgxNZeOcaWXdnVAesvS4VZ7uFDxP7MHFoJLqROHuYOW8LH+iF+4LD0dfOM0CxzN
	 Sdnc9ejJMahOj9IgSkZnWj9dGxMfKbQ+46OZUDT3Vrcf9nEZI/Wq5VmEb5Ydkr9oeH
	 DT1U+f8SnbdYQ2LrKVAq3q0U57t1XqxBmakLUxxw=
Message-ID: <0e7e1311-bbd8-4e5e-9dae-5f1616b9788d@ideasonboard.com>
Date: Wed, 16 Apr 2025 16:37:18 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 1/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org
References: <cover.1729240989.git.geert+renesas@glider.be>
 <05e43f61321b4191d5f97dec2349facd4b56c899.1729240989.git.geert+renesas@glider.be>
 <CAMuHMdUiR0N+CS2FOp3aNa_mouLMYNk_r9oBLzBgNXAfM84f3A@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CAMuHMdUiR0N+CS2FOp3aNa_mouLMYNk_r9oBLzBgNXAfM84f3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/04/2025 16:27, Geert Uytterhoeven wrote:
> Hi all,
> 
> On Fri, 18 Oct 2024 at 11:33, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>> Add support for the mini-DisplayPort connector on the White Hawk
>> BreakOut board.  This port is driven by a TI SN65DSI86 DSI to eDP
>> bridge, which in turn gets the pixel data from the second DSI channel on
>> the R-Car V4H SoC.  Note that this port is not present on the White Hawk
>> Single development board.
>>
>> Based on the work by Tomi Valkeinen for the mini-DP port on the White
>> Hawk CPU board, and by a patch in the BSP by LUU HOAI.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> Does not work:
>>    - Display resolution is detected correctly (1920x1080 or 2560x1440),
>>    - Black screen, displays say no signal detected,
> 
> The second display pipeline has a Display Stream Compression (DSC)
> encoder between the Display Unit (DU) and the DSI encoder.  Forcing the
> DSC module clock on gives a working display, just like on Sparrow Hawk.
> 
> So now we just need DT bindings for the DSC, and a very simple DSC
> driver that calls pm_runtime_resume_and_get() ;-)

Alright, nice. Sometimes (rarely...) the solution is as easy as we 
thought it would be ;)

  Tomi


