Return-Path: <linux-renesas-soc+bounces-34596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dzgPAiv1RGoR4AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 13:08:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5F96EC929
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 13:08:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jqpT5q+o;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC24630C8343
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 11:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F4343E9C4;
	Wed,  1 Jul 2026 11:03:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE2A3EFD37;
	Wed,  1 Jul 2026 11:03:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903785; cv=none; b=fujV0I62u0CelVJbAOOIzQf8rq/p/HOOtm0ZlivrF/7dH2UlKY+0TTj9Zcr9a67t7vwth0SskNcMoF6Vy6Sxinfy5gaNrk1UU+L6X3LFQehxPOL4v4D5NlbwyfSbBgrXXAov/60y+p/QkvFCHyOD2yfTy8Zr76awf4fXanxEOjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903785; c=relaxed/simple;
	bh=oSXoKiQbcnn/eFBQoGnHI/NFWn0OUGz8XEf+BbJFaOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A4jSWD03uiEFTTwiCeUANpErwRLoIlkTkK+SZfOb5F8OsUsqAM6RXK0WqhzA/fuwI97H4FWHBP1ohwrDge6f8r7jNE/EPu5PltoM4Xubd9mOhVUNyl7C9h94IyDpz2aLRR8OeuMdAPtICFH/vtk7hhCP3Q7RyEIwM1j90Y+gYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqpT5q+o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C6F1F00A3E;
	Wed,  1 Jul 2026 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903781;
	bh=0nJAphDVGN2oAiE07pv9pV03rezp6xzrirqRR1IPuCs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jqpT5q+oxak8lw4OKg7KObRDsPCPA5ybKmTnKIItmtU2YwajHDcgcV+l+yiGlusWb
	 HramakaJDwmOqycBgu1uZlu8cHvUDCIgCWgrRbqbZW5RSCQ+tAjWFTtcL3H8bq+Axd
	 kAYmnsRVBz1sJYqzdX+0C7u6J4VUy8YzGDoqiF8DZsCfN+qahBipJhqUDDUzlCNKW1
	 7UIiv6V9zaofM9kGpNGj08FbFyB/Q/gZN9m92ywGNwZIYyRerxhcF5xn/1ukwFNlEq
	 sHnGbRvKgzzInU0eNpJNzdtOpMNksIi0FaHENW/j/OG1DloxuLYruqs70ikpsE4hsw
	 ExO4or+hOVucw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260630171333.36396-1-ahmisaranrao@gmail.com>
References: <20260630171333.36396-1-ahmisaranrao@gmail.com>
Subject: Re: [PATCH v2] ASoC: renesas: fsi: Propagate platform_get_irq()
 errors
Message-Id: <178284457267.368110.14436206886662500739.b4-ty@b4>
Date: Tue, 30 Jun 2026 19:36:12 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oSXoKiQbcnn/eFBQoGnHI/NFWn0OUGz8XEf+BbJFaOM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRPPi3wX4sCcg8RZyslZf2wjJO+7A0T0C5Qx7m
 yjFFBtYoKiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakTz4gAKCRAk1otyXVSH
 0BhhB/0YW9PujkxPuvXd310T3js6J1KlCl1674uJJebf5Be4pekzpgRIzQOccTrPxEXxxIm3bfH
 4K9NedibJZAJwI36daA85XPo0qoSGuqAYeMWHagnFUMlrojEpSxvoBm27HtgyPiDCqOO9aMdDgw
 Fug3nKh7UItmv0S/EvkJHAviEIYrbvUFoOcedBLv2hV95RkOnKBE/LVotXc3OkaGtshwb4EWJA6
 C2wtHIGIvzH6LwaXhuwZHC5DPzGWxpfAQphCHE/mlwbeoKgV2vzAWSPujSd9yJTj/aZD/EqXrNW
 VAsgNBwd3NG7xQHMQlDzlD0xh7eRxiG44PRWmKHubGDbXt9y
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-34596-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:ahmisaranrao@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,glider.be,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B5F96EC929

On Tue, 30 Jun 2026 22:43:33 +0530, Narasimharao Vadlamudi wrote:
> ASoC: renesas: fsi: Propagate platform_get_irq() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: renesas: fsi: Propagate platform_get_irq() errors
      https://git.kernel.org/broonie/sound/c/3848617c64ac

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


