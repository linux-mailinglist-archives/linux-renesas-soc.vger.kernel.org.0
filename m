Return-Path: <linux-renesas-soc+bounces-27044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD9D3AB51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E930303A01E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 14:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4974D378D74;
	Mon, 19 Jan 2026 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Zro+wjvY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E73236CDF4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831608; cv=none; b=jtH6pN/yLrUoN5Jq+EBTnSiYOiNuHYFl1vD+8uLlBKgwZPGisGbQFguTKvjEovbgQb854IOvAheMerIcQ6++WjSYNR8Y2H/Q7P70j8ox/TXSWaibnfI5z88kIb+zlKRVR/k14YDn8kPv/H2/x+y00H3A1af2P0ew8/XQvzpbxtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831608; c=relaxed/simple;
	bh=PaO//h4aaHpeXDKTCutId0QKH8llt3+YpQISpJCLbuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyXPhlDWO9ojHdpV5ig/Eh1SX6N0L9b5834HV2WJgB9OwwAjT2XUh/ivpKQ4cYVO84Q/IlwudPUhh/SddHxCwPx9gWizXEE2jtLmbdpBts+hCvkhwB0bNVtLqFGC+43jK+S16X2dkh+sR2vmUBcIqw3BS8i/36PvzZzXznSlY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Zro+wjvY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so3842891f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768831604; x=1769436404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYbPS1Q1egGiEf+FowJflS+CPH/nAP63ilv5+paqrac=;
        b=Zro+wjvYnlwdzhnKyDhs9ZwuUFG9gdqikr6/HWBhWvQZHjBJzodIaSZgCmgYbacTga
         aS46SGkJG69+rIPMMuAYSIkCm3gkclmMCSGKctjKFnrreHZFINpTtA3ojujadP8gx2LK
         xUiZeBJ2fcUGGyeqkfLYyX6yRP7btWg9AUKznBEcgfWFdk0HNeX0KJXRXVDWlH5taI+G
         nH5nf3XfuSMUBY9tu0/LSjRpjMlDFETW6AR2/B7IE/n8VRRgksP+kboYZ1znzWuGwb0A
         OVw8SOxtpsG1W5JhKmhSlsYSb91eHaUqnJhXTSEwvUKM8Fq3OuYldQ+FBZyJ8QuriJgm
         7AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831604; x=1769436404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYbPS1Q1egGiEf+FowJflS+CPH/nAP63ilv5+paqrac=;
        b=O6HjMR/eILCEU1Jv00s6/vkAALGZSUEskX2mnvjrby9lhaR3LmUYFusxslop40/nhp
         ru6Zg4MTxtCOVqRjaQQutbKGxZccuVrIV96+4PcgZSz6HmFspI1eGnav870lwL5NHCA3
         e4mbo5uN+OYn9Z72+TvaaqInwd7PGViXBmW4LYOJ56bFjONITgJb59p4trwi2/Qj2xS6
         v+GEg4eetf02ClAXA13+KXiukoq9rVKQzA1iMFvWMrFXaQu/ZZYtFk7nsikvuW1RmqRA
         /B3DV4isT4L35q6LGLNNAhLahWCCCgWnqjKt07cJTXtEfHjrh4lE3PAs0O+rhWo2vdQc
         xsDw==
X-Forwarded-Encrypted: i=1; AJvYcCWSJuTiBHGyBBo7jUPhH+LxnHFMxs8KsvXk/wrA2nS01OmcAGhaKJ/F0mb7XNFet5DUfYGH6haHv/X13gShHWMPIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2UdvHR8ud//Gm3cTw8eG+myQW/IXvkBDbQfGxosK5qpUtu8k5
	sZBOaEhG7SVqBzrUDKeAQFT40Vkee/vmKkYg/cEpoVrR4jFMn5LIlGxK3V37SQAqzIM=
X-Gm-Gg: AZuq6aLrzNSjapopav3ik/lUelSW96Tt/oI1ijzDqB7ALWC0NSgFe6PIRtxAm9UyAmQ
	5ujmH9nRrz71HU5lSdVlQoZDqYxcowg3YCYBWLtObVh7rQWKq4MYbhNgq+dfEfUdXA3LuHGHbF9
	EqmgLC94S8dIuWJ6XePhaFnqHt3oL7d+3mdYiColB4MIIMrlouGk9ysfjjDFeKTL22jlrhla6Uw
	q4ylEr08QNri3BelGtU4lIbwJE9aoivXvzh/Er4uGcxObmEeZrYLqtbZfp9usz0nH5hAWyQBsfr
	tedXEYU4HClWM/HhUDjtam6Qh/8D8FBdhyZ9/oNXz8p/oCZebfxNTD6LTaV7ck7VRSJkwvT2PkW
	I+P3fnme7xTZWscTlEknZnCr5nM3CDox06PUhXR4VSI/sD99SOW9L3WV0RpmnTkOBGrAFt9SUbE
	ISsm208kvmfvy3XWo60Q==
X-Received: by 2002:a05:6000:2c05:b0:432:84f9:9803 with SMTP id ffacd0b85a97d-4356a033304mr13973113f8f.3.1768831603708;
        Mon, 19 Jan 2026 06:06:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435699271dfsm22767776f8f.15.2026.01.19.06.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 06:06:43 -0800 (PST)
Message-ID: <ade158ba-0532-4eb0-b95c-5c7de16b490d@tuxon.dev>
Date: Mon, 19 Jan 2026 16:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] PCI: rzg3s-host: Fix inbound window size tracking
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-3-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260114153337.46765-3-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 1/14/26 17:33, John Madieu wrote:
> The current implementation incorrectly resets size_id each iteration
> instead of accumulating, causing incorrect remaining size calculations
> when mapping DMA regions across multiple windows.
> 
> Fixes: 7ef502fb35b2 ("PCI: rzg3s-host: Add Renesas RZ/G3S SoC host driver")

Same here with regards to the commit title.

> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index c1053f95bc95..205b60421be1 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1313,7 +1313,7 @@ static int rzg3s_pcie_set_inbound_windows(struct rzg3s_pcie_host *host,
>   
>   		pci_addr += size;
>   		cpu_addr += size;
> -		size_id = size;
> +		size_id += size;
>   		id++;
>   	}
>   	*index = id;


