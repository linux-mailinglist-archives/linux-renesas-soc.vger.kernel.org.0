Return-Path: <linux-renesas-soc+bounces-30125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMPXKNF9wWknTgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 18:52:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EAE2FA876
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 18:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8FAE3055A04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 17:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4453CBE98;
	Mon, 23 Mar 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="Nv8MHeXf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B963CCFD2;
	Mon, 23 Mar 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774287677; cv=none; b=q2bAM+CgHeSCgO+jiefzGMUThDd8EWVPm+/1A5Q8ivAAKs+VbkTSdqNVLViN9uWxzEpkPSonZMBe9FH61rJ+P/foTHihaZ8cFNUpY07D01YvkiUDXn1YxSqqM5Nxt9RMoayH7CTC6c6HMaaxiGykMJyqeshDxztdbIoatzVKNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774287677; c=relaxed/simple;
	bh=VNbeoXsnXbo+98jSq/Bl5LZJAYWTKJV7TzFcNeLE4Oo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ulbOLKcFQscVEM5SSFdTG8Hsxi7Z2NvjIwuL+aMZhS/WyV8cx7NNxqe0VLI53syhO+zvV1NgTJbqSMcga0e2WBe7jcaLPrPocIT0PucHCOfVFyOtSCpHS3XIcj7aO4l+LAlgsIQ0VoE+qOC+zq/su8q+7/rshAEYtpGgB0t3eTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=Nv8MHeXf; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=EtCsnBnZz2wovDVb2c1WqzkKZB1qCNcO5X2CZ7cgDMk=; b=Nv8MHeXfYy1zDbtwL544BfXXL2
	xUDpz9v2/6kr95JFN3HJAZ8/g8Ss8JhcYSEGO7/HSyZVKhCgf+fieiT2Dq1z8hz5mOzbSmtNwgHod
	GeAmspCxs6Q/PuX5+h1F8BcpQo6CWFJAJj5O5evhQ96LIHTayRPxp7WsuwZjNssoIfPI=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w4jH1-0000000028R-2NHB;
	Mon, 23 Mar 2026 13:41:07 -0400
Date: Mon, 23 Mar 2026 13:41:06 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: biju.das.au <biju.das.au@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chris Brandt <Chris.Brandt@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sam Ravnborg
 <sam@ravnborg.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/4] drm: renesas: rzg2l_mipi_dsi: Increase reset
 deassertion delay to 1 msec
Message-Id: <20260323134106.a439ffad5d1ff6927e0c549f@hugovil.com>
In-Reply-To: <TY3PR01MB113460833AFD4BE4422E5E737864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
	<20260319164833.409126-5-biju.das.jz@bp.renesas.com>
	<20260323102015.957b2f855b7d54aa5d33869d@hugovil.com>
	<TY3PR01MB113460833AFD4BE4422E5E737864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30125-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hugovil.com:dkim,hugovil.com:email,hugovil.com:mid]
X-Rspamd-Queue-Id: 16EAE2FA876
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Mon, 23 Mar 2026 15:19:27 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Hugo,
> 
> > -----Original Message-----
> > From: Hugo Villeneuve <hugo@hugovil.com>
> > Sent: 23 March 2026 14:20
> > Subject: Re: [PATCH v2 4/4] drm: renesas: rzg2l_mipi_dsi: Increase reset deassertion delay to 1 msec
> > 
> > Hi Biju,
> > 
> > On Thu, 19 Mar 2026 16:48:28 +0000
> > Biju <biju.das.au@gmail.com> wrote:
> > 
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
> > > requires waiting more than 1 msec after deasserting the CMN_RSTB
> > > signal before the DSI-Tx module is ready. Increase the delay from 1
> > > usec to
> > > 1 msec by replacing udelay(1) with fsleep(1000).
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > In your first submission, I commented that "...this should be backported to stable branches (missing
> > Fixes / Cc: stable tags)?" and you answered with "Agreed, will add fixes/stable tags".
> > 
> > If you still agree, this patch should be #3 in your list, so that it is easier/straightforward to
> > backport to stable branches.
> 
> The patch order is changed. that is the reason I have not added any fixes/stable tags.

This is not a logical nor valid justification if the change
merits to be backported to stable branches as you indicated in
series 1. Why have you changed your mind?

> The if check in patch#3 makes it is not backportable to stable branches.

If you put the delay patch before that "if check", then it is
irrelevant, no?

> If I reorder this to patch#3 it is fixing just the delay mentioned in the hardware manual.

Yes, and that is also exactly what this current version does, no?

For me, it is simply changing a delay from 1us to 1ms. Whether you
change it before or after another patch isn't supposed to matter in the
end, unless I am missing something?


-- 
Hugo Villeneuve

