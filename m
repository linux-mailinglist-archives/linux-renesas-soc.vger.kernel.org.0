Return-Path: <linux-renesas-soc+bounces-28644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKvfLHe7pWnNFQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:31:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF71DCDFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D689230B3BC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF1636EAAB;
	Mon,  2 Mar 2026 16:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NybzX7s7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB7130B51E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468727; cv=none; b=VBjGrS/4IqCHP9yBtw69R2v9qqWUNiP5zi65/LKetSYpiHG9IrPE6WqOiJebunUbjPnJTh6VSSNW/l/IGjoc6z8y2pdY4UwMbkG/Wcbg6gEkOD9n4NRg2Tm1eqoeV0aV+5uLsAkLSzbQQy0L3oyRsLGTFtb3R7kP54zIFn3ScnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468727; c=relaxed/simple;
	bh=w0JfEAL8UQJ6mwvoIym34kQuZstRGM9t3S3tUgFM7p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFFL9g+Wbbk/M4Zz25u2tWTZYdN/asDZ03p5KNc2uRuz5CMNF/+fsSNYIg0eUW0QyzO3Oz6cB5pv+wI/DAHho76/gFVDaE6+gxRj8KP5yxkjNDLs4HF7pD9j9P9ig7rXOWY6UC0hpuvJD9u6R802MenA8skssFZWGU3BlcePYZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NybzX7s7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436e8758b91so3016349f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772468724; x=1773073524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsRF/yJZ5HdWuSiQ8L7Xgp4L8TnqAkrXaWtbBnRsnSw=;
        b=NybzX7s7FTuQY3g/l0A65lOcwxaR2inYaNu8p9A3zaC0tf9hayJC6WzIb88ea8wx6I
         WJnkyovdWgzi8cdVZHSNLuErCv/hiAT+gmPVz1AvOxxUbADQ+44TWD+whbw/xiYgWcYk
         CrS+l47SQid4pDb/4GFAahuIcZqojAsT7rHc/GPNeRiJpbzrDY9GuH6hNW/RZiHd46/+
         8mv74ZI8ZEz5Gol6HjzoxqVDA3jO4O8DC0UzEp5iHXLO2isiIDvzZG7/xwS1o6ICPVzY
         gE69PrqTHuFPhzTU+Gb9drGfmMSS8eb8EhusyvkIDwxOP5JHn0x4in5ZQiFrhYjGfwO6
         f/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468724; x=1773073524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsRF/yJZ5HdWuSiQ8L7Xgp4L8TnqAkrXaWtbBnRsnSw=;
        b=mYVw6OGMpndgjxxYSHCy5maA5kMiX5FiOfg5/bY2zim5K95UF1CdzfJ921lRSKLcxQ
         GF0DRYFUfCC7YnmEVEJ96eO16Sof2gt+ij1dtKTyCSfuBrmP38FFNEdxtgGIFs45uXWs
         q7ba1N9l6mVG4JBgEzfMt8zSvWIYzn5RxyHpaHxq1H8ExyXkSpQl2st4bqVMcs0dR0bq
         KeRaa+CbSreLxWt3+Ek2x58ugAqSaeZfVm9aVDC2+QvhRdnaPyNXxLnG1qs7C0mpCFnl
         Zb8gFe4j/BULDnQ34NAOv+p2iarcwvfmEi4HDNVwuLFvvO1Crcnm6k5WUZVQfFZgBDex
         V4zA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYS+oLchqsQKGC50u2IWorQqsjaw6u/FWSrXvURZ8IWWOz+LpVAUYpiEu4Bew6rO8iUK95H3BGetfaTtwRH5ivA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqrjkPSNZYHoq1Vl2RPOiZPgplQnzkN/afbI9Wny7L5lZnKjD2
	RcutML7tKtcOC/WDxcJu3CbCW95dGOfSMvpN8RvTHtHj8lRL4MJtJpSvlzoPYsLxuaw=
X-Gm-Gg: ATEYQzxwF82ygbXGa0NO8YHVvNrtRz9Z7btxnHsF4uqB9yo1nmFzXZhjkwekBXZpV8u
	F2IgabKS2ZU8PHRo2P9Se5GkCcPbvubz8x63tpI7a5VlwVzlQdTFRgimCLP2IeyCYCM9WRRnpJY
	2XTcvK+SUWt0uRSeqyDeaa6w1cjbq+wwov/lOelhuJLt5oWguQKmKI4JSzIq3RO7ccXahjzpoEi
	kyfDeS8EnR8FXs4YOf38LaJqZQiBuiIcm/yh5iEk07i3hbvmMofqXCgoNgMaEcMgrfeVARw1qHI
	pshRml8ETMnDr3IgPGCJR77tCMgV9lKUKNRaytWhrboIFU9oFpoxJsWRsAvlTcezfQf3O325DWU
	J2xAKGhJEhELiIUjw34SSjpdNccE+JzZYnVl/BoVO6JuDXuqeqSDi3nu3f12QgeJslU5ZEfAbqR
	WaL9oeUv2PxvYJetmxI95/fgmfwlrv7JTfJap8HFrwwor/Iqo=
X-Received: by 2002:a05:6000:1acb:b0:437:6629:9b82 with SMTP id ffacd0b85a97d-4399de3aacfmr21667465f8f.52.1772468724121;
        Mon, 02 Mar 2026 08:25:24 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm5477752f8f.33.2026.03.02.08.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:25:23 -0800 (PST)
Message-ID: <3b30df38-3a68-4d1b-9e61-77a80d3fe8a2@tuxon.dev>
Date: Mon, 2 Mar 2026 18:25:19 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/15] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-12-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-12-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 56FF71DCDFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28644-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi, John,

Something got wrong with the patch description for this version. See below.

On 2/27/26 17:32, John Madieu wrote:
> Extend the link speed configuration to support Gen3 (8.0 GT/s) in
> additionvto Gen2 (5.0 GT/s). This is required for RZ/G3E PCIe host

s/additionvto/addition to

> support, which is Gen3 capable.
> 
> Instead of relying on DT max-link-speed for configuration, read the
> hardware capabilities from the PCI_EXP_LNKCAP register to determine the
> maximumvsupported speed. The DT max-link-speed property is now only used

s/maximumvsupported/maximum supported

> as anvoptional limit when explicitly specified, which aligns with PCIe

s/anvoptional/an optional

> subsystemvexpectations.

s/subsystemvexpectations/subsystem expectations

Thank you,
Claudiu

> 
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

