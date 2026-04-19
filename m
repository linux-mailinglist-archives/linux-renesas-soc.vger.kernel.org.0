Return-Path: <linux-renesas-soc+bounces-31379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACdlN7Mx5GlpSQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 03:36:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 417A6422D6E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 03:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B6883008C02
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 01:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002DB2264A9;
	Sun, 19 Apr 2026 01:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3RLrBta"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2A202C5C
	for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Apr 2026 01:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776562608; cv=pass; b=LJteF/a/TmaN6q9iImxvUXdJSacp7wq86DyA53KYP5dAzVT7ApfaQXSDgekjA+C+rliW2Vinl4cQzciA9M2RTQzyt328CArnY6dWob/q7l0RgG2q5Xe5RphVUBr4CjNeQUMCqo3sVH4SGM7+VXVz9/Uc8XJZwyV8f0w5JpW4P+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776562608; c=relaxed/simple;
	bh=tJf8VqeyhC+zGhTETPvM/GQMuwQga6VQBinmbv+fEqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7uQDDSrKQoVfzkgRePr9LZtMiiKgy5qU6gBRdmrDIuSpAndU7ZmtVIE+vS9eJTf34nxK36Am2ngsG9tVVd+yRtdKx+TcL2iMYEGbT0wYqy2gOCjFNABzSL348e3pLNOpuCBI2kAEqxmW1dItgnV80oG5B2HLZEiP7+tYdfEziw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3RLrBta; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so1317248fac.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Apr 2026 18:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776562606; cv=none;
        d=google.com; s=arc-20240605;
        b=PZsgp31Cn7XW86xc93ujDw7NODKguy0UD2OnudDrKfMqaTyo5gB+efi8CbE3TTDjs6
         x0j9hHV8d7ubq7PJVcsQOwfg3iPYsDWxkhf5By0T5n3dA2FOQU5oJb+9R1jTW5XIk8Gl
         9EumLV6hwQ+37DWu+tF+QQmy463Go/LgujRX5clfeVKDn+s8GkxyV846r9nwjou74ZpD
         J+YISz4x/BQXY6AJCOyP7qd6IIQiYTmJvlwPiHDHEAq7SN/UQSpMfDqAw3Y1tD9o5bYw
         AjZWrMWfcEXqg58nDQzlZYLuMZUKQlTifqR3+Dbbq1aPrdcyQ2P4NEuTd9w+RAxh40C9
         ut6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJf8VqeyhC+zGhTETPvM/GQMuwQga6VQBinmbv+fEqw=;
        fh=Nyqr9BkW2wLWUGh3lfzURzuhGuPLfU8+b7do+eKdhmc=;
        b=jEJh0PE6x2cKPXWJbAI4Lc0n8lQwUB1HtCSogmiefsoWPj2Eg4ketz6Ms9/SYk6fg+
         i1bDX76i04GIWq3TTqm8j7ZVCHTJT+Yq6ZgpXQb8x2Ip4YDSxi/9b87KhARiXesBiFW9
         QhgF6emteZYJAOZFbbFwyFooXBbIMA0NDjV8s46fEKXQCIv75bZxPo8j102HI1hsHqxj
         ekZ7Uf3pC8reWqtElZIAZKh3y2rU4w5EJq6HUFeJ2yYTp4AwOl4PoljoB52uJ+9pe/IR
         TTuHKmrOSK87vr/8eeQ0mcIgzFoi+qZL1uQHNoyWCZWXd7tMFKnI9lEIyISHYNXOj4II
         8ywQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776562606; x=1777167406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJf8VqeyhC+zGhTETPvM/GQMuwQga6VQBinmbv+fEqw=;
        b=j3RLrBtaT81GyeOEgzqU5C5Vm9tmyi+BT8IkUiRn/0RVGgKPimjPESlCgNhf2QDpAo
         xF6G7cBBmg46MDsuQ3PwZXN95XoElMciAk+TLy7tbxBztItZ7w/os7Yz9GAh4ZHDdj+v
         4lhGhOfkTrxnOzXeuhMfBbg4DInR6Aw10+ZMsbjvEl9qOj2KInxlVeNSSV6Jtv/S1WqF
         BEFUSAjiT/zh1HGMGk8UcIYVgK4MoR7l8Bom5gnyRGzH51v+o3X8yZdZSfFcVH9cOiek
         0euUWQ5V6jLE8Xg4B8gMpHI6fb0UhHaipKRLbLtBs/0rqlIgBuqlxde1RoV9Ju8KP2TB
         ECDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776562606; x=1777167406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJf8VqeyhC+zGhTETPvM/GQMuwQga6VQBinmbv+fEqw=;
        b=SkVTJyARECRa0DWuDdLysnRiq+Njn0C4Vtl4ClUR90dM/Q6qyDGEAW+zB93dXDM5Yi
         7XS8lRFM46Cxia4l8VZzS6qV6kwAbWFOWcRXobp5sdoh2U1LlKS7u9JGziwm3DZsMLsC
         jMkr2tJRa/et2R5XydbOyHLZSsROdZsxNkdHO6Qtb0KYNNMR3VktAOo1A89+9QjYQ91k
         A8C+6E6O0P+8qO5I+FyGsg7I6ycv2ZUFwOWte1u9bXgoIJ5S28Sjsaj6qi8lrELJbfMo
         stJmLenNNeO7mZRG/+Fk+ID2lck6NqGliTziiWTARTVy2qyIM3eZPyaL/40k3JiNFoKN
         Jbqg==
X-Gm-Message-State: AOJu0YzNUqEJxb1Ti8Syyw+aPMG6I04rE6D3rG8pthTHTqlOuFsronBd
	deEbjQhvjquLECdHVQDUNXQhk8ddLDSsel7HZS56CzbQOH1qINqN/2zjPH99q4UV/h+QZOBoBQd
	hglFikSAi/ea8nQWZ+VJBdaC3GXU4wFKmZg==
X-Gm-Gg: AeBDietszwCyTzH7tl9QQ17gz67E2SQE2QVjt0sMl1fNOYgF3YYexV3/9t8TfPsxAIz
	egx9XJD8YnByaz9GCwaoYcWs6fmNUyFHYwUH0QNK+bvQynnHJ/UjR7O9KBJD/l7vYpGmT/QDibv
	9L05IQVeIQDtLLSge5duhPnLk+B7OHJFfG0stmmMFTCQN2oQC92BMY9sHNB6E3tHNsP7KZ++85z
	0SG3Cp/fw7YkexZvpG1RZolc0fe1vjRwddGqAA1CdHO6e4zedd8EhkpwcTE7uy+Rw90YFKErl0z
	1pAKmMXSHc1HAbKW1ys=
X-Received: by 2002:a05:6871:a869:b0:417:5aa1:bc9f with SMTP id
 586e51a60fabf-42aded6827fmr5252888fac.26.1776562606324; Sat, 18 Apr 2026
 18:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413104240.30493-1-wsa+renesas@sang-engineering.com>
 <20260413104240.30493-2-wsa+renesas@sang-engineering.com> <CABb+yY0NrmCRu7c3Y0JiahmVCNCq-B57TckQC++X=HY6bL0-sQ@mail.gmail.com>
 <aeQaYmXr8XV9r3ME@shikoro>
In-Reply-To: <aeQaYmXr8XV9r3ME@shikoro>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Apr 2026 20:36:35 -0500
X-Gm-Features: AQROBzAMLcu9IEGf9Z_7RLCtH4tjp_J8O8DQ9SFnUUUFW44WfKNMisEr2ToUD1o
Message-ID: <CABb+yY3oRr72YDPicQeETbYTE6G87Xeb2iGv-BwvFnEe7ct9AQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailbox: add sanity check for channel array
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31379-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: 417A6422D6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 6:57=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > This sounds like a quick suggestion from some AI tool -- looks nice
> > but doesn't mean much.
>
> Nope, from the cover letter:
>
> While diving deeper into this subsystem, I manually found these two
> issues which I wanted to fix right away.
>
> I just wanted to check which parameters are required and which are
> optional. And the array is definitely required, so the core should check
> for it IMHO.
>
I am saying that it is still not sufficient if we get so paranoid and
start doing what are basically static checks. What if the array at
chans is not NULL but less than num_chans?
num_chans check acts as the "required" indicator already.

> > point to an array of channels. NULL is just another garbage value, why
> > not also check for 0xdeadbabe or 0xffff... ?
>
> Because NULL is what we get if we kzalloc a structure unlike the values
> you mentioned.
>
Why can't the mbox structure be reused or be at some offset of a
bigger allocation? See, there is no end to theoretical dangers.

> > I can let loose a claude session and I will find 1000s of such "fixes"
> > in the kernel.
>
> No AI was involved in the generation of these patches. I think I marked
> the patches which resulted from AI review correctly so far.
>
To be clear, I am not against using AI tools. I use them myself. A lot.
All I am saying is its a slippery slope of "this check is good to
have, at least it doesn't hurt", with the AI tools we can generate
1000s of such patches that are only to "educate" the developer rather
than making any runtime difference.

Regards,
Jassi

