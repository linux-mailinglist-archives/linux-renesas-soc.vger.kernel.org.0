Return-Path: <linux-renesas-soc+bounces-31662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN8WOM6e7mlhwAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 01:25:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5E46B7F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 01:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96861302CB01
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Apr 2026 23:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F763168EB;
	Sun, 26 Apr 2026 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A20w0M/M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B331354C;
	Sun, 26 Apr 2026 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245769; cv=none; b=Qr3OEuiY5xZI26WZziNmyvBm7vzbmq0Hd8uZw8LCM0jBtI1rZDGy6Ad7ZZ7grPoz8fqJPZHY3aAK0Upda0yr1Fs/uRermGNcrZYnUgy4OjdA6UA29JzN+vj+a41kWJLJF66yKzXkn60EikLBpuRdHYC5GNDxUrXdxgHK6Tz8crs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245769; c=relaxed/simple;
	bh=vsE+qGgh80QPiXBguRKauJtPXyHdh1L5XMvQYWaxFw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EjRqfKwTNzJ4yVcgBa9Cq5Ym9TI2Rws0DkV6ZjQbDqciQ1UQZWpzXp78k64QNDGNqzaL1fqtakj7brYdjfYt//XjxFmCMNU9ikvzsVuk2rFa74fZ8CL/VcGtAUKe7Q7yndS9pNTqrlSvtX4ncrh0ZTmmAA+StdZOqAOjC6IGvME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A20w0M/M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D540C2BCB4;
	Sun, 26 Apr 2026 23:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245769;
	bh=vsE+qGgh80QPiXBguRKauJtPXyHdh1L5XMvQYWaxFw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A20w0M/MF7I+C3++RQZv7ep6L3zI0jKcxQls7UAKndSlINMvtyRn+p1hl9gpWpcd8
	 bOIypMW8pQUVsUB2RJs2xQ3tzDYz+IxpJpJWFw5qB5+p9Rt84COrwT5F5KNzsbZeRC
	 B2qOLc2n9GBkyFXIK0wVcmpz8YdhYDzrm/5myn1AwYl9jr1sk6iVgo0ZZHnKRlrLfh
	 dfUoe1gNe4edP0l8//SoPqOFh8QIhC2k996JUZKghi87b/XKDm4xs5xCQrs1terXst
	 ey9E/bllNhyShl2dOFZF/4IXKo+73nLrlHzs94fotow0SbgMAzPx9Y3brzOqUWwlxt
	 YMY9QmetLIzFQ==
From: Mark Brown <broonie@kernel.org>
To: fabrizio.castro.jz@renesas.com, 
 John Madieu <john.madieu.xa@bp.renesas.com>
Cc: cosmin-gabriel.tanislav.xa@renesas.com, linux-spi@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 john.madieu@gmail.com, biju.das.jz@bp.renesas.com
In-Reply-To: <20260425024725.2393632-1-john.madieu.xa@bp.renesas.com>
References: <20260425024725.2393632-1-john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH] spi: rzv2h-rspi: Fix silent failure in clock setup
 error path
Message-Id: <177723991132.266775.12421850325652488655.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:45:11 +0900
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vsE+qGgh80QPiXBguRKauJtPXyHdh1L5XMvQYWaxFw4=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGnunkegcseI/qrazox6E4eVsdhr0Ku2Bz7dfpIJCGOUyE5OU
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJp7p5HAAoJECTWi3JdVIfQQuIH/Air
 TiXj0pn11TxFw5hoPbgwLl3+QUz/zTD9UwR6atqPZnhbVgg2CcLchCHPgJ2hVsJT2qnOFj9x9zE
 PE7vdXKwrggW+fzDvncpVwnFgsGvnfb8KpmDZasULktRuHrZ8j/N7KsQ9p4AKGis53hK42MhDkl
 TMRZMnw9aZBQsyMSxbWLmK2KoBnvQyNV9Xmc4ayY88dM6zJsvayzS3ymoFJ8uQtqS0Kl5hshE5f
 A69c/XH14mWb03AVXHm/sFtNGxG1sZBhtqtV/1s11XBCUWfQLY57yk8dA+aGrpKFnO1SvCPbpvg
 reamSg1LRWWaZvUHrYm0EEGngZkTazZPD9FAsgQ=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: 5FB5E46B7F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31662-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[renesas.com,vger.kernel.org,gmail.com,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sat, 25 Apr 2026 02:47:25 +0000, John Madieu wrote:
> spi: rzv2h-rspi: Fix silent failure in clock setup error path

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: rzv2h-rspi: Fix silent failure in clock setup error path
      https://git.kernel.org/broonie/spi/c/54900126ae0a

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


